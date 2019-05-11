//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DataToDecimalTests.swift
//
// Created by Vadim Koleoshkin on 11/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class DataToDecimalTests: XCTestCase {
    
    func testToDecimal() {
        expect{
            try EthNumber(value: 256).value().toDecimal()
        }.to(
            equal(Decimal(256)),
            description: "Data expected to be converted correctly"
        )
    }
    
    func testToNormalizedDecimal() {
        expect{
            try EthNumber(
                value: 256
            ).value().toNormalizedDecimal(
                power: 2
            )
        }.to(
            equal(Decimal(2.56)),
            description: "Data expected to be converted correctly"
        )
    }
    
    func testToDecimalString() {
        expect{
            try EthNumber(
                value: 256
            ).value().toDecimalString()
        }.to(
            equal("256"),
            description: "Data expected to be converted correctly"
        )
    }
    
}
