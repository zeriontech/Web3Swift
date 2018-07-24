//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthManuallySignedTransactionBytesTests.swift
//
// Created by Vadim Koleoshkin on 24/07/2018
//

import Nimble
import Quick
@testable import Web3Swift

class EthManuallySignedTransactionBytesTests: XCTestCase {
    
    func testStaticParametersEncodedCorrectly() {
        
        expect{
            return try EthManuallyTransactionBytes(
                networkID: SimpleInteger(
                    integer: 1
                ),
                transactionsCount: EthNumber(
                    value: 130
                ),
                gasPrice: EthNumber(
                    hex: "0x04A817C800"
                ),
                gasEstimate: EthNumber(
                    value: 21000
                ),
                recipientAddress: Alice().address(),
                weiAmount: EthNumber(
                    value: 1
                ),
                contractCall: EmptyBytes(),
                s: BytesFromHexString(hex: "13d42bc12afce56c22b16d5208209e20dd3825bb9f4b706d080ac565597063bf"),
                v: BytesFromHexString(hex: "26"),
                r: BytesFromHexString(hex: "4566e88fcc334ce45530cd443177fc943573ef2234188df7e5fb58c93f9f1359")
            ).value().toHexString()
            
        }.to(
            equal(
                "f86581828504a817c80082520894cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e018026a04566e88fcc334ce45530cd443177fc943573ef2234188df7e5fb58c93f9f1359a013d42bc12afce56c22b16d5208209e20dd3825bb9f4b706d080ac565597063bf"
            ),
            description: "The above transaction with a nonce of 130 signed with Bob's key on external device is expected to be correctly signed"
        )
        
    }
}
