//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GetTransactionsCountProcedureTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

//TODO: We really need to think about the structure of out unit tests and how we can pass dependencies (such as infura url and address) to the tests themselves
final class GetTransactionsCountProcedureTests: XCTestCase {
    
    /// Assert network call returns non empty data
    func testNotEmptyData() {
        expect{
            try GetTransactionsCountProcedure(
                network: FakeEthereumNetwork(),
                address: Alice().address(),
                blockChainState: LatestBlockChainState()
            ).call()
        }.toNot(
            beEmpty(),
            description: "Make sure network call returns non empty response"
        )
    }
    
    /// Assert response contains positive value
    func testValueGreaterThanZero() {
        expect{
            try BigEndianCompactNumber(
                hex: GetTransactionsCountProcedure(
                    network: FakeEthereumNetwork(),
                    address: Alice().address(),
                    blockChainState: LatestBlockChainState()
                ).call()["result"].string()
            ).uint()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Make sure positive number is returned"
        )
    }
    
}
