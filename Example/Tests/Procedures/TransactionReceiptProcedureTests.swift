//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TransactionReceiptProcedureTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class TransactionReceiptProcedureTests: XCTestCase {

    func testNotEmptyReceipt() {
        expect{
            try TransactionReceiptProcedure(
                network: MainnetInfuraNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).call()["result"].type
        }.to(
            equal(.dictionary),
            description: "This transaction from etherscan is expected to not be empty"
        )
    }

}
