//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersEqualityTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersEqualityTests: XCTestCase {

    func testEqualNumbersAreEqual() {
        expect{
            try UnsignedNumbersEquality(
                lhs: EthNumber(
                    value: 42
                ),
                rhs: EthNumber(
                    value: 42
                )
            ).value()
        }.to(
            equal(
                true
            ),
            description: "Equal numbers are expected to be considered equal"
        )
    }

    func testUnequalNumbersAreUnequal() {
        expect{
            try UnsignedNumbersEquality(
                lhs: EthNumber(
                    value: 42
                ),
                rhs: EthNumber(
                    value: 43
                )
            ).value()
        }.to(
            equal(
                false
            ),
            description: "Unequal numbers are expected to be considered unequal"
        )
    }

    func testEqualNumbersWithDifferentPaddingAreEqual() {
        expect{
            try UnsignedNumbersEquality(
                lhs: LeftZeroesPaddedBytes(
                    origin: EthNumber(
                        value: 42
                    ),
                    length: 20
                ),
                rhs: LeftZeroesPaddedBytes(
                    origin: EthNumber(
                        value: 42
                    ),
                    length: 32
                )
            ).value()
        }.to(
            equal(
                true
            ),
            description: "Equal numbers are expected to be considered equal regardless of padding"
        )
    }

    func testEqualNumbersHigherThanIntMaxAreEqual() {
        expect{
            try UnsignedNumbersEquality(
                lhs: UnsignedNumbersSum(
                    terms: [
                        EthNumber(
                            value: Int.max
                        ),
                        EthNumber(
                            value: 1
                        )
                    ]
                ),
                rhs: UnsignedNumbersSum(
                    terms: [
                        EthNumber(
                            value: Int.max
                        ),
                        EthNumber(
                            value: 1
                        )
                    ]
                )
            ).value()
        }.to(
            equal(
                true
            ),
            description: "Equal numbers are expected to be evaluated as equal regardless of their size"
        )
    }

}