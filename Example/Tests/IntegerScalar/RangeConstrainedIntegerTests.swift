//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// RangeConstrainedIntegerTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class RangeConstrainedIntegerTests: XCTestCase {

    func testValuesWithinRangeArePersisted() {
        Array<Int>(
            [
                10,
                11,
                12,
                13,
                14,
                15
            ]
        ).forEach{ integer in
            expect{
                try RangeConstrainedInteger(
                    origin: SimpleInteger(
                        integer: integer
                    ),
                    minimum: 10,
                    maximum: 15
                ).value()
            }.to(
                equal(
                    integer
                ),
                description: "Value \(integer) is expected to be within range [10; 15]"
            )
        }
    }

    func testValuesOutOfRangeThrow() {
        Array<Int>(
            [
                Int.min,
                -1,
                0,
                9,
                16,
                Int.max
            ]
        ).forEach{ integer in
            expect{
                try RangeConstrainedInteger(
                    origin: SimpleInteger(
                        integer: integer
                    ),
                    minimum: 10,
                    maximum: 15
                ).value()
            }.to(
                throwError(
                    errorType: IntegerOutOfRange.self
                ),
                description: "Value \(integer) is expected to be out of range [10; 15] and thus throw"
            )
        }
    }

    func testSingleElementRangeIsValid() {
        expect{
            try RangeConstrainedInteger(
                origin: SimpleInteger(
                    integer: 1
                ),
                minimum: 1,
                maximum: 1
            ).value()
        }.to(
            equal(
                1
            ),
            description: "Single value ranges are expected to valid"
        )
    }

    func testIncorrectRangeThrows() {
        expect{
            try RangeConstrainedInteger(
                origin: SimpleInteger{
                    throw UnknownError()
                },
                minimum: 2,
                maximum: 1
            ).value()
        }.to(
            throwError(
                errorType: IncorrectRange.self
            ),
            description: "Incorrect range is expected to throw"
        )
    }

}