//
// Created by Timofey on 3/19/18.
//

import Foundation
import SwiftyJSON

//Eth account that asks gas price and gas estimate from the network
public final class EthAutoAccount: Account {

    private let network: Network
    private let privateKey: PrivateKey

    /**
    Ctor

    - parameters:
        - network: network to work with
        - privateKey: private key associated with the account
    */
    init(
        network: Network,
        privateKey: PrivateKey
    ) {
        self.network = network
        self.privateKey = privateKey
    }

    /**
    - returns:
    Balance of the account in wei

    - throws:
    `DescribedError` if something went wrong
    */
    public func balance() throws -> NumberScalar {
        return try EthBalance(
            network: network,
            address: privateKey.address()
        )
    }

    //TODO: This DSL intentionally violates laziness by calling SendRawTransactionProcedure.call. This is definitely not OO. Maybe we can somehow split DSL and use it only as a procedural wrapper.
    /**
    Send value from this account to the recipient

    - returns:
    `TransactionHash` of the transaction

    - throws:
    `DescribedError` if something went wrong
    */
    public func send(weiAmount: NumberScalar, to recipientAddress: BytesScalar) throws -> TransactionHash {
        return try EthTransactionHash(
            network: network,
            transactionHash: BytesFromCompactHexString(
                hex: SimpleString(
                    string: SendRawTransactionProcedure(
                        network: network,
                        transactionBytes: EthTransactionBytes(
                            network: network,
                            senderKey: privateKey,
                            recipientAddress: recipientAddress,
                            weiAmount: weiAmount
                        )
                    ).call()["result"].string()
                )
            )
        )
    }

}