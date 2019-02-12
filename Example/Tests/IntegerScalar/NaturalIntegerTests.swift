//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// NaturalIntegerTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class NaturalIntegerTests: XCTestCase {

    func testNaturalIntegersPersist() {
        Array<Int>(
            [
                0,
                1,
                42,
                Int.max
            ]
        ).forEach{ integer in
            expect{
                try NaturalInteger(
                    origin: SimpleInteger(
                        integer: integer
                    )
                ).value()
            }.to(
                equal(
                    integer
                ),
                description: "Natural integer \(integer) is expected to persist"
            )
        }
    }

    func testNonNaturalIntegersThrow() {
        Array<Int>(
            [
                -1,
                -42,
                Int.min
            ]
        ).forEach{ integer in
            expect{
                try NaturalInteger(
                    origin: SimpleInteger(
                        integer: integer
                    )
                ).value()
            }.to(
                throwError(
                    errorType: IntegerOutOfRange.self
                ),
                description: "Negative integer \(integer) is expected to throw"
            )
        }
    }

}