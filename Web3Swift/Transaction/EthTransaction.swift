//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransaction.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** A transaction from the blockchain */
public final class EthTransaction: Transaction {

    private let procedure: RemoteProcedure

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
        procedure = TransactionProcedure(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    Number of transactions deployed by sender before this one

    - throws:
    `DescribedError` if something went wrong
    */
    public func nonce() throws -> BytesScalar {
        return try EthNaturalNumber(
            hex: procedure.call()["result"]["nonce"].string()
        )
    }

}
