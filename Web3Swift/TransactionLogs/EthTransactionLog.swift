//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionLog.swift
//
// Created by Vadim Koleoshkin on 14/05/2019
//

import Foundation
import SwiftyJSON

public final class EthTransactionLog: TransactionLog {
    
    private let log: JSON
    
    public init(serializedLog: JSON) {
        self.log = serializedLog
    }
    
    public func signature() -> BytesScalar {
        return self.topics()[0]
    }
    
    public func topics() -> [BytesScalar] {
        return log["topics"].arrayValue.map {
            BytesFromHexString(hex: $0.stringValue)
        }
    }
    
    public func data() -> ABIMessage {
        return ABIMessage(
            message: log["data"].stringValue
        )
    }
    
    
    public func index() -> EthNumber {
        return EthNumber(
            hex: log["index"].stringValue
        )
    }
    
    public func removed() -> BooleanScalar {
        return SimpleBoolean(
            bool: log["removed"].boolValue
        )
    }
    
    public func address() -> EthAddress {
        return EthAddress(
            hex: log["address"].stringValue
        )
    }
    
    public func transactionHash() -> EthTxHash {
        return EthTxHash(
            hex: log["transactionHash"].stringValue
        )
    }
    
    public func blockHash() -> BlockHash {
        return BlockHash(
            hex: log["blockHash"].stringValue
        )
    }
    
    public func blockNumber() -> EthNumber {
        return EthNumber(
            hex: log["blockNumber"].stringValue
        )
    }
    
    public func transactionIndex() -> EthNumber {
        return EthNumber(
            hex: log["transactionIndex"].stringValue
        )
    }
}
