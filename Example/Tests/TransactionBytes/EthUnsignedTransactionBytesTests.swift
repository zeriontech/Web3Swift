//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthUnsignedTransactionBytesTests.swift
//
// Created by Vadim Koleoshkin on 24/07/2018
//

import Nimble
import Quick
@testable import Web3Swift

class EthUnsignedTransactionBytesTests: XCTestCase {
    
    func testStaticParametersEncodedCorrectly() {
        
        expect{
            return try EthUnsignedTransactionBytes(
                networkID: SimpleInteger(
                    integer: 1
                ),
                transactionsCount: EthNumber(
                    value: 128
                ),
                gasPrice: EthNumber(
                    hex: "0x04A817C800"
                ),
                gasEstimate: EthNumber(
                    value: 21000
                ),
                recipientAddress: Alice().address(),
                weiAmount: EthNumber(
                    hex: "0x01"
                ),
                contractCall: EmptyBytes()
            ).value().toHexString()
        }.to(
            equal(
                "e581808504a817c80082520894cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e0180018080"
            ),
            description: "Transaction parameters expected to encoded correctly"
        )
    }
}
