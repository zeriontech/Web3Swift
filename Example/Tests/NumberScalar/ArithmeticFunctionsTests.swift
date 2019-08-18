//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ArithmeticFunctionsTests.swift
//
// Created by Vadim Koleoshkin on 18/08/2019
//

import Nimble
import Quick
@testable import Web3Swift

class ArithmeticFunctionsTests: XCTestCase {
 
    func testPlus() {
        expect{
            try (
                EthNumber(value: 2) + EthNumber(value: 2)
            ).value().toDecimalString()
        }.to(
            equal("4"),
            description: "Expect 2 + 2 = 4"
        )
    }
    
    func testMinus() {
        expect{
            try (
                EthNumber(value: 10) - EthNumber(value: 3)
            ).value().toDecimalString()
        }.to(
            equal("7"),
            description: "Expect 10 - 3 = 7"
        )
    }
    
    func testMultiply() {
        expect{
            try (
                EthNumber(value: 8) * EthNumber(value: 8)
            ).value().toDecimalString()
        }.to(
            equal("64"),
            description: "Expect 8 * 8 = 64"
        )
    }
    
    func testDivide() {
        expect{
            try (
                EthNumber(value: 24) / EthNumber(value: 8)
            ).value().toDecimalString()
        }.to(
            equal("3"),
            description: "Expect 24 / 8 = 3"
        )
    }
    
    func testEqual() {
        expect{
            try (
                EthNumber(value: 1994) == EthNumber(value: 1994)
            ).value()
        }.to(
            equal(true),
            description: "Expect 1994 = 1994"
        )
    }
    
}
