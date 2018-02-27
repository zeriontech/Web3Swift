//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TransactionHashParameterTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class TransactionHashParameterTests: XCTestCase {
    
    /// Assert valid transaction hash does not throws an error
    func testValidTransactionHash() {
        
        expect{
            try TransactionHashParameter(
                    transactionHash: SimpleHex(
                        value: "0xcd1864163f3a77ce0153d0c9d5d211ff55e0256cd632c1e6d19ac0f5bd430753"
                    )
                ).value()
        }.notTo(
            throwError(),
            description: "Make sure valida transaction hash does not throw and error"
        )
        
    }
    
    /// Assert invalid transaction hash throws an error of type `InvalidTransactionHashError`
    func testInValidTransactionHash() {
        
        expect{
            try TransactionHashParameter(
                transactionHash: SimpleHex(
                    value: "0xAAAcd1864163f3a77ce0153d0c9d5d211ff55e0256cd632c1e6d19ac0f5bd430753"
                )
            ).value()
        }.to(
            throwError(),
            description: "Make sure longer transaction hash throws an error"
        )
        
        expect{
            try TransactionHashParameter(
                transactionHash: SimpleHex(
                    value: "0xcd1864163f3a77ce0153d0c9d5d211ff55e0256cd632c1e6d19ac0f5bd430"
                )
            ).value()
        }.to(
            throwError(),
            description: "Make sure shorter transaction hash throws an error"
        )
        
    }
    
}
