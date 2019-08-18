//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthBlockHashTests.swift
//
// Created by Vadim Koleoshkin on 23/05/2019
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class EthBlockHashTests: XCTestCase {

    func testCorrectHashValueFromBytes()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"
                ),
                network: MainnetAlchemyNetwork()
            ).value().toPrefixedHexString()
        }.to(
            equal("0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"),
            description: "Expect block hash to have correct value"
        )
    }
    
    func testCorrectHashValueFromString()
    {
        expect{
            try EthBlockHash(
                hex: "0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891",
                network: MainnetAlchemyNetwork()
            ).value().toPrefixedHexString()
        }.to(
            equal("0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"),
            description: "Expect block hash to have correct value"
        )
    }
    
    func testCorrectHashValueFromStringScalar()
    {
        expect{
            try EthBlockHash(
                hex: SimpleString(
                    string: "0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"
                ),
                network: MainnetAlchemyNetwork()
            ).value().toPrefixedHexString()
        }.to(
            equal("0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"),
            description: "Expect block hash to have correct value"
        )
    }
    
    func testCorrectBlockValueHash()
    {
        expect{
            try EthBlockHash(
                hex: "0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891",
                network: MainnetAlchemyNetwork()
            ).block().hash().value().toPrefixedHexString()
        }.to(
            equal("0x2f3d84a9e5007e4a1755cefab11b27b298fb23dcee161ffd260696d0068b7891"),
            description: "Expect block hash to have correct value"
        )
    }

}
