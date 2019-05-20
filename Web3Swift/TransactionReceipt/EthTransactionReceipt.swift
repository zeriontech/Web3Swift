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
import SwiftyJSON

/** Receipt returned by network for transaction */
public final class EthTransactionReceipt: TransactionReceipt {
    
    let receipt: JSON
    /**
    Ctor

    - parameters:
        - transactionHash: bytes representation of the transaction hash
    */
    public init(
        receipt: JSON
    ) {
        self.receipt = receipt
    }

    /**
    - returns:
    Gas amount that was used up by the transaction

    - throws:
    `DescribedError if something went wrong`
    */
    public func usedGasAmount() throws -> BytesScalar {
        return try EthNumber(
            hex: receipt["gasUsed"].string()
        )
    }
    
    public func logs() throws -> CollectionScalar<TransactionLog> {
        return try CachedCollection(
            origin: SimpleCollection(
                collection: receipt["logs"].array().map {
                    EthTransactionLog(serializedLog: $0)
                }
            )
        )
    }
    
    public func blockHash() throws -> BlockHash {
        return try EthBlockHash(
            hex: receipt["blockHash"].string()
        )
    }
    
    public func cumulativeUsedGasAmount() throws -> EthNumber {
        return try EthNumber(
            hex: receipt["cumulativeGasUsed"].string()
        )
    }

}
