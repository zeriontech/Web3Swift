//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionHash.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Hash of a raw transaction data */
public final class EthTransactionHash: TransactionHash {
    
    private let transactionHash: BytesScalar

    /**
    Ctor

    - parameters:
        - transactionHash: bytes representation of the transaction hash
    */
    public init(
        transactionHash: BytesScalar
    ) {
        self.transactionHash = FixedLengthBytes(
            origin: transactionHash,
            length: 32
        )
    }

    /**
    - returns:
    `Transaction` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    public func transaction(network: Network) throws -> Transaction {
        return try EthTransaction(
            transaction: TransactionProcedure(
                network: network,
                transactionHash: transactionHash
            ).call()["result"]
        )
    }

    /**
    - returns:
    `TransactionReceipt` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    public func receipt(network: Network) throws -> TransactionReceipt {
        return try EthTransactionReceipt(
            receipt: TransactionReceiptProcedure(
                network: network,
                transactionHash: transactionHash
            ).call()["result"]
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
