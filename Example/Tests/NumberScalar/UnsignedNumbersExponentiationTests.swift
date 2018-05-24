//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersExponentiationTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersExponentiationTests: XCTestCase {

    func testUInt256MaxIsComputedCorrectly() {
        expect{
            try HexAsDecimalString(
                hex: UnsignedNumbersDifference(
                    minuend: UnsignedNumbersExponentiation(
                        base: EthNumber(
                            value: 2
                        ),
                        exponent: SimpleInteger(
                            integer: 256
                        )
                    ),
                    subtrahend: EthNumber(
                        value: 1
                    )
                )
            ).value()
        }.to(
            equal(
                "115792089237316195423570985008687907853269984665640564039457584007913129639935"
            ),
            description: "UInt256.max value is expected to computed correctly"
        )
    }

    func testIdentityHolds() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersExponentiation(
                    base: EthNumber(
                        value: 42
                    ),
                    exponent: SimpleInteger(
                        integer: 1
                    )
                )
            ).value()
        }.to(
            equal(
                42
            ),
            description: "Exponent of 1 is expected to be an identity"
        )
    }

    func testNumberToThePowerZeroIsOne() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersExponentiation(
                    base: EthNumber(
                        value: 42
                    ),
                    exponent: SimpleInteger(
                        integer: 0
                    )
                )
            ).value()
        }.to(
            equal(
                1
            ),
            description: "Any positive number to the power 0 is expected to equal to 1"
        )
    }

    func testZeroToThePowerZeroIsEqualToLimit() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersExponentiation(
                    base: EthNumber(
                        value: 0
                    ),
                    exponent: SimpleInteger(
                        integer: 0
                    )
                )
            ).value()
        }.to(
            equal(
                1
            ),
            description: "Raising 0 to the power 0 is expected to give of the limit value which is 1"
        )
    }

}