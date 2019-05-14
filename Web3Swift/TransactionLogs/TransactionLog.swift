//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TransactionLog.swift
//
// Created by Vadim Koleoshkin on 14/05/2019
//

import Foundation

public protocol TransactionLog {
    
    func signature() -> BytesScalar
    
    func topics() -> [BytesScalar]
    
    func data() -> ABIMessage
    
    func index() -> EthNumber
    
    func removed() -> BooleanScalar
    
    func address() -> EthAddress
    
    func transactionHash() -> EthTxHash
    
    func blockHash() -> BlockHash
    
    func blockNumber() -> EthNumber
    
    func transactionIndex() -> EthNumber
    
}
