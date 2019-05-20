//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthBlock.swift
//
// Created by Vadim Koleoshkin on 21/05/2019
//

import Foundation
import SwiftyJSON

public final class EthBlock: Block {
    
    private let block: JSON
    
    init(block: JSON) {
        self.block = block
    }
    
    public func number() throws -> EthNumber {
        return try EthNumber(
            hex: block["number"].string()
        )
    }
    
    public func hash() throws -> BlockHash {
        return try EthBlockHash(
            hex: block["hash"].string()
        )
    }
    
    public func parentHash() throws -> BlockHash {
        return try EthBlockHash(
            hex: block["parentHash"].string()
        )
    }
    
    public func timestamp() throws -> EthNumber {
        return try EthNumber(
            hex: block["timestamp"].string()
        )
    }
    
    public func transactions() throws -> CollectionScalar<Transaction> {
        return try CachedCollection(
            origin: SimpleCollection(
                collection: block["transactions"].array().map {
                    EthTransaction(transaction: $0)
                }
            )
        )
    }
    
    
}
