//
// Created by Timofey on 3/19/18.
//

import Foundation

//Hash of a raw transaction data
public final class EthTransactionHash: TransactionHash {

    private let network: Network
    private let transactionHash: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network to work with
        - transactionHash: bytes representation of the transaction hash
    */
    public init(
        network: Network,
        transactionHash: BytesScalar
    ) {
        self.network = network
        self.transactionHash = transactionHash
    }

    /**
    - returns:
    `Transaction` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    public func transaction() throws -> Transaction {
        return EthTransaction(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    `TransactionReceipt` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    public func receipt() throws -> TransactionReceipt {
        return EthTransactionReceipt(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    Keccak256 hash of the raw transaction

    - throws:
    `DescribedError if something went wrong`
    */
    public func value() throws -> Data {
        return try transactionHash.value()
    }

}