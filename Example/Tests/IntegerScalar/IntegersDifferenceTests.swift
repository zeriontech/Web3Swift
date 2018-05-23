//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersDifferenceTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegersDifferenceTests: XCTestCase {

    func testCorrectIntegerDifferenceIsComputed() {
        expect{
            try IntegersDifference(
                minuend: SimpleInteger(
                    integer: 200
                ),
                subtrahend: SimpleInteger(
                    integer: 250
                )
            ).value()
        }.to(
            equal(
                -50
            ),
            description: "A correct difference is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try IntegersDifference(
                minuend: SimpleInteger(
                    integer: Int.min
                ),
                subtrahend: SimpleInteger(
                    integer: 0
                )
            ).value()
        }.to(
            equal(
                Int.min
            ),
            description: "0 is expected to be an identity"
        )
    }

    func testOverflowThrows() {
        expect{
            try IntegersDifference(
                minuend: SimpleInteger(
                    integer: Int.min
                ),
                subtrahend: SimpleInteger(
                    integer: 1
                )
            ).value()
        }.to(
            throwError(
                errorType: IntegerOverflow.self
            ),
            description: "Subtracting 1 from Int.min is expected to be an overflow"
        )
    }

}