//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersSumTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersSumTests: XCTestCase {

    func testNumbersAreSummedCorrectly() {
        expect{
            try HexAsDecimalString(
                hex: UnsignedNumbersSum(
                    terms: [
                        EthNumber(
                            value: 1
                        ),
                        SimpleBytes(
                            bytes: [
                                0xff
                            ]
                        ),
                        EthNumber(
                            hex: "0xff"
                        )
                    ]
                )
            ).value()
        }.to(
            equal(
                "511"
            ),
            description: "A correct sum is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try HexAsDecimalString(
                hex: UnsignedNumbersSum(
                    terms: [
                        EthNumber(
                            value: 42
                        ),
                        EthNumber(
                            value: 0
                        )
                    ]
                )
            ).value()
        }.to(
            equal(
                "42"
            ),
            description: "Identity is expected to hold"
        )
    }

    func testExceedingIntMaxIsLegal() {
        expect{
            try UnsignedNumbersSum(
                terms: [
                    EthNumber(
                        value: Int.max
                    ),
                    EthNumber(
                        value: 1
                    )
                ]
            ).value()
        }.toNot(
            throwError(),
            description: "Arbitrary length number is expected to be able to exceed Int.max"
        )
    }

}