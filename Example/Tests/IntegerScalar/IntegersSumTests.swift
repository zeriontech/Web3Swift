//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersSumTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegersSumTests: XCTestCase {

    func testCorrectIntegerSumIsComputed() {
        expect{
            try IntegersSum(
                terms: [
                    1,
                    2,
                    3,
                    -5
                ]
            ).value()
        }.to(
            equal(
                1
            ),
            description: "A correct sum is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try IntegersSum(
                terms: [
                    Int.max,
                    0
                ]
            ).value()
        }.to(
            equal(
                Int.max
            ),
            description: "0 is expected to be an identity"
        )
    }

    func testOverflowThrows() {
        expect{
            try IntegersSum(
                terms: [
                    Int.max,
                    1,
                ]
            ).value()
        }.to(
            throwError(
                errorType: IntegerOverflow.self
            ),
            description: "Int.max + 1 is expected to be an overflow"
        )
    }

}