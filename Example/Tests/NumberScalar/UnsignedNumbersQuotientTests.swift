//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersQuotientTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersQuotientTests: XCTestCase {

    func testNumbersAreDividedCorrectly() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersQuotient(
                    dividend: EthNumber(
                        value: 204
                    ),
                    divisor: EthNumber(
                        value: 5
                    )
                )
            ).value()
        }.to(
            equal(
                40
            ),
            description: "A correct quotient without decimal part is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersQuotient(
                    dividend: EthNumber(
                        value: Int.max
                    ),
                    divisor: EthNumber(
                        value: 1
                    )
                )
            ).value()
        }.to(
            equal(
                Int.max
            ),
            description: "A divisor of 1 is expected to be an identity"
        )
    }

    func testDivisionByZeroThrows() {
        expect{
            try UnsignedNumbersQuotient(
                dividend: EthNumber(
                    value: 1
                ),
                divisor: EthNumber(
                    value: 0
                )
            ).value()
        }.to(
            throwError(
                errorType: DivisionByZero.self
            ),
            description: "Division by 0 is expected to be an error"
        )
    }

    func testTwoEthFromWeiConversionIsCorrect() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersQuotient(
                    dividend: EthNumber(
                        hex: "0x1bc16d674ec80000"
                    ),
                    divisor: EthNumber(
                        hex: "0x0de0b6b3a7640000"
                    )
                )
            ).value()
        }.to(
            equal(
                2
            ),
            description: "2000000000000000000 wei is expected to be equal to 2 eth"
        )
    }

}