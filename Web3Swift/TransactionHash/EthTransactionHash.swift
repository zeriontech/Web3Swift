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
