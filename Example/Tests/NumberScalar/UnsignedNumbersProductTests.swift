//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnsignedNumbersProductTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UnsignedNumbersProductTests: XCTestCase {

    func testCorrectIntegerProductIsComputed() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersProduct(
                    terms: [
                        EthNumber(
                            value: 3
                        ),
                        EthNumber(
                            value: 4
                        ),
                        EthNumber(
                            value: 5
                        )
                    ]
                )
            ).value()
        }.to(
            equal(
                60
            ),
            description: "A correct product is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try EthInteger(
                hex: UnsignedNumbersProduct(
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
                Int.max
            ),
            description: "1 is expected to be an identity"
        )
    }

    func testExceedingIntMaxIsLegal() {
        expect{
            try UnsignedNumbersProduct(
                terms: [
                    EthNumber(
                        value: Int.max
                    ),
                    EthNumber(
                        value: 2
                    )
                ]
            ).value()
        }.toNot(
            throwError(),
            description: "Arbitrary length number is expected to be able to exceed Int.max"
        )
    }

}