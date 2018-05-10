//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthContractCreationBytes.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Bytes of a signed contract deployment transaction */
public final class EthContractCreationBytes: BytesScalar {

    private let origin: BytesScalar

    /**
    Ctor

    - parameters:
        - networkID: id of a network where the transaction is to be deployed
        - transactionsCount: count of all transactions previously sent by the sender
        - gasPrice: gas price in Wei
        - gasEstimate: estimate for gas needed for transaction to be mined
        - senderKey: private key of a sender
        - weiAmount: amount to be sent in wei
        - contractCall: encoded contract ctor call
    */
    public init(
        networkID: NumberScalar,
        transactionsCount: NumberScalar,
        gasPrice: NumberScalar,
        gasEstimate: NumberScalar,
        senderKey: PrivateKey,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
    ) {
        self.origin = EthTransactionBytes(
            networkID: networkID,
            transactionsCount: transactionsCount,
            gasPrice: gasPrice,
            gasEstimate: gasEstimate,
            senderKey: senderKey,
            recipientAddress: EmptyBytes(),
            weiAmount: weiAmount,
            contractCall: contractCall
        )
    }

    /**
    Ctor

    - parameters:
        - network: network where transaction is to be deployed
        - senderKey: private key of a sender
        - weiAmount: amount to be sent in wei
        - contractCall: encoded contract ctor call
    */
    public convenience init(
        network: Network,
        senderKey: PrivateKey,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
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
        let contractCall = CachedBytes(
            origin: contractCall
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
                    gasEstimate: EthGasEstimate(
                        network: network,
                        senderAddress: senderAddress,
                        gasPrice: gasPrice,
                        weiAmount: weiAmount,
                        contractCall: contractCall
                    ),
                    gasPrice: gasPrice,
                    weiAmount: weiAmount,
                    contractCall: contractCall
                )
            ),
            senderKey: senderKey,
            weiAmount: weiAmount,
            contractCall: contractCall
        )
    }

    /**
    - returns:
    Bytes of the initialized contract as `Data`
    */
    public func value() throws -> Data {
        return try origin.value()
    }

}
