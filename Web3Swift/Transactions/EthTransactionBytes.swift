//
// Created by Timofey on 3/15/18.
//

import CryptoSwift
import Foundation

//Signed transaction bytes
public final class EthTransactionBytes: BytesScalar {

    private let networkID: NumberScalar
    private let transactionsCount: NumberScalar
    private let gasPrice: NumberScalar
    private let gasEstimate: NumberScalar
    private let senderKey: PrivateKey
    private let recipientAddress: BytesScalar
    private let weiAmount: NumberScalar

    /**
    Ctor

    - parameters:
        - networkID: id of a network where the transaction is to be deployed
        - transactionsCount: count of all transactions previously sent by the sender
        - gasPrice: gas price in Wei
        - gasEstimate: estimate for gas needed for transaction to be mined
        - senderKey: private key of a sender
        - recipientAddress: address of a recipient
        - weiAmount: amount to be sent in wei
    */
    internal init(
        networkID: NumberScalar,
        transactionsCount: NumberScalar,
        gasPrice: NumberScalar,
        gasEstimate: NumberScalar,
        senderKey: PrivateKey,
        recipientAddress: BytesScalar,
        weiAmount: NumberScalar
    ) {
        self.networkID = networkID
        self.transactionsCount = transactionsCount
        self.gasPrice = gasPrice
        self.gasEstimate = gasEstimate
        self.senderKey = senderKey
        self.recipientAddress = recipientAddress
        self.weiAmount = weiAmount
    }

    /**
    Ctor

    - parameters:
        - network: Network where transaction is to be deployed
        - senderKey: private key of a sender
        - recipientAddress: address of a recipient
        - weiAmount: amount to be sent in wei
    */
    convenience public init(
        network: Network,
        senderKey: PrivateKey,
        recipientAddress: BytesScalar,
        weiAmount: NumberScalar
    ) {
        let senderAddress = CachedBytes(
            origin: SimpleBytes{
                try senderKey.address().value()
            }
        )
        let gasPrice = CachedNumber(
            origin: EthGasPrice(
                network: network
            )
        )
        self.init(
            networkID: CachedNumber(
                origin: BigEndianNumber(
                    bytes: SimpleBytes{
                        try network.id().hex().value()
                    }
                )
            ),
            transactionsCount: CachedNumber(
                origin: BigEndianNumber(
                    bytes: SimpleBytes{
                        try EthTransactions(
                            network: network,
                            address: senderAddress,
                            blockChainState: PendingBlockChainState()
                        ).count().hex().value()
                    }
                )
            ),
            gasPrice: gasPrice,
            gasEstimate: CachedNumber(
                origin: EthGasEstimate(
                    network: network,
                    senderAddress: senderAddress,
                    recipientAddress: recipientAddress,
                    gasPrice: gasPrice,
                    weiAmount: weiAmount
                )
            ),
            senderKey: senderKey,
            recipientAddress: recipientAddress,
            weiAmount: weiAmount
        )
    }

    /**
    It should be noted that 35 is the magic number suggested by EIP155 https://github.com/ethereum/EIPs/blob/master/EIPS/eip-155.md

    - returns:
    signed transaction as `Data` that can be deployed for mining

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let transactionParameters: [RLP] = [
            EthRLP(number: transactionsCount),
            EthRLP(number: gasPrice),
            EthRLP(number: gasEstimate),
            SimpleRLP(bytes: recipientAddress),
            EthRLP(number: weiAmount),
            SimpleRLP(bytes: [])
        ]
        let signature = SECP256k1Signature(
            privateKey: senderKey,
            message: SimpleRLP(
                rlps: transactionParameters + [
                    EthRLP(number: networkID),
                    SimpleRLP(bytes: []),
                    SimpleRLP(bytes: [])
                ]
            ),
            hashFunction: SHA3(variant: .keccak256).calculate
        )
        return try SimpleRLP(
            rlps: transactionParameters + [
                EthRLP(
                    number: BigEndianCompactNumber(
                        origin: BigEndianNumber(
                            uint: networkID.uint() * 2 + 35 + signature.recoverID().uint()
                        )
                    )
                ),
                SimpleRLP(bytes: signature.r().hex()),
                SimpleRLP(bytes: signature.s().hex())
            ]
        ).value()
    }

}