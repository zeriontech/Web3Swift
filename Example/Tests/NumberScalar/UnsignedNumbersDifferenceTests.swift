//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersDifferenceTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersDifferenceTests: XCTestCase {

    func testNumbersAreSubtractedCorrectly() {
        expect{
            try HexAsDecimalString(
                hex: UnsignedNumbersDifference(
                    minuend: EthNumber(
                        value: 513
                    ),
                    subtrahend: SimpleBytes(
                        bytes: [
                            0xff
                        ]
                    )
                )
            ).value()
        }.to(
            equal(
                "258"
            ),
            description: "Numbers are expected to be subtracted correctly"
        )
    }

    func testIdentityHolds() {
        expect{
            try HexAsDecimalString(
                hex: UnsignedNumbersDifference(
                    minuend: EthNumber(
                        value: 513
                    ),
                    subtrahend: EthNumber(
                        value: 0
                    )
                )
            ).value()
        }.to(
            equal(
                "513"
            ),
            description: "Subtrahend of 0 is expected to be an identity"
        )
    }

    func testSubceedingZeroThrows() {
        expect{
            try UnsignedNumbersDifference(
                minuend: EthNumber(
                    value: 0
                ),
                subtrahend: EthNumber(
                    value: 1
                )
            ).value()
        }.to(
            throwError(
                errorType: IntegerOverflow.self
            ),
            description: "Subceeding 0 is considered illegal"
        )
    }

    func testSubtractingTwoFromIntMaxPlusOneWorksCorrectly() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersDifference(
                    minuend: UnsignedNumbersSum(
                        terms: [
                            EthNumber(
                                value: Int.max
                            ),
                            EthNumber(
                                value: 1
                            )
                        ]
                    ),
                    subtrahend: EthNumber(
                        value: 2
                    )
                )
            ).value()
        }.to(
            equal(
                Int.max - 1
            ),
            description: "Numbers are expected to be added and subtracted correctly"
        )
    }

}