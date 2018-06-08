//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersProductTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegersProductTests: XCTestCase {

    func testCorrectIntegerProductIsComputed() {
        expect{
            try IntegersProduct(
                terms: [
                    SimpleInteger(
                        integer: 3
                    ),
                    SimpleInteger(
                        integer: -3
                    ),
                    SimpleInteger(
                        integer: 3
                    )
                ]
            ).value()
        }.to(
            equal(
                -27
            ),
            description: "A correct product is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try IntegersProduct(
                terms: [
                    SimpleInteger(
                        integer: Int.max
                    ),
                    SimpleInteger(
                        integer: 1
                    )
                ]
            ).value()
        }.to(
            equal(
                Int.max
            ),
            description: "1 is expected to be an identity"
        )
    }

    func testOverflowThrows() {
        expect{
            try IntegersProduct(
                terms: [
                    SimpleInteger(
                        integer: Int.max
                    ),
                    SimpleInteger(
                        integer: 2
                    )
                ]
            ).value()
        }.to(
            throwError(
                errorType: IntegerOverflow.self
            ),
            description: "Multiplying Int.max by 2 is expected to be an overflow"
        )
    }

}