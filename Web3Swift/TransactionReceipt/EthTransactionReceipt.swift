//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionReceipt.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Receipt returned by network for transaction */
public final class EthTransactionReceipt: TransactionReceipt {

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
        self.procedure = TransactionReceiptProcedure(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    Gas amount that was used up by the transaction

    - throws:
    `DescribedError if something went wrong`
    */
    public func usedGasAmount() throws -> NumberScalar {
        return try BigEndianCompactNumber(
            hex: procedure.call()["result"]["gasUsed"].string()
        )
    }

}
