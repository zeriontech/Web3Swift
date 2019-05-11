//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DataToHexTests.swift
//
// Created by Vadim Koleoshkin on 11/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class DataToHexTests: XCTestCase {

    func testToHex() {
        expect{
            try EthNumber(value: 256).value().toHexString()
        }.to(
            equal("0100"),
            description: "Data expected to be converted to hex correctly"
        )
    }
    
    func testToPrefixedHex() {
        expect{
            try EthNumber(value: 256).value().toPrefixedHexString()
        }.to(
            equal("0x0100"),
            description: "Data expected to be converted to prefixed hex correctly"
        )
    }

}
