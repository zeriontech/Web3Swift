//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionsTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class EthTransactionsTests: XCTestCase {
    
    /// Assert that transaction count returns positive number
    func testTransactionsCount() {
        expect{
            try EthInteger(
                hex: EthTransactions(
                    network: GanacheLocalNetwork(),
                    address: Alice().address(),
                    blockChainState: PendingBlockChainState()
                ).count()
            ).value()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Make sure positive number is returned"
        )
    }

}
