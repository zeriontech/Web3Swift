//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// NumericBooleanTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class NumericBooleanTests: XCTestCase {

    func test0ProducesFalseBoolean() {
        expect{
            try NumericBoolean(
                bool: EthNaturalNumber(
                    value: 0
                )
            ).value()
        }.to(
            equal(
                false
            ),
            description: "0 is considered a representation of false"
        )
    }

    func test1ProducesTrueBoolean() {
        expect{
            try NumericBoolean(
                bool: EthNaturalNumber(
                    value: 1
                )
            ).value()
        }.to(
            equal(
                true
            ),
            description: "1 is considered a representation of true"
        )
    }

    func testOtherNumbersThrowError() {
        expect{
            try NumericBoolean(
                bool: EthNaturalNumber(
                    value: 2
                )
            ).value()
        }.to(
            throwError(errorType: NotANumericBooleanError.self),
            description: "Numbers other than 0 or 1 are considered to be an error"
        )
    }

}
