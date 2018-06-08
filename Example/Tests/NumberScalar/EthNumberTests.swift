//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthNumberTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EthNumberTests: XCTestCase {

    func testNumberFromIntegerIsComputedCorrectly() {
        Array<
            (
                integer: Int,
                bytes: [UInt8]
            )
        >(
            [
                (
                    integer: 0,
                    bytes: [
                        0x00
                    ]
                ),
                (
                    integer: 1,
                    bytes: [
                        0x01
                    ]
                ),
                (
                    integer: 42,
                    bytes: [
                        0x2a
                    ]
                ),
                (
                    integer: Int.max,
                    bytes: [
                        0x7f
                    ] + Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    )
                )
            ]
        ).forEach{ integer, bytes in
            expect{
                try BytesAsCollection(
                    origin: EthNumber(
                        value: integer
                    )
                ).value()
            }.to(
                equal(
                    bytes
                ),
                description: "EthNumber is expected to be a big endian compact representation of an integer"
            )
        }
    }

    func testNumbersExceedingIntMaxAreAllowed() {
        expect{
            try EthNumber(
                hex: SimpleBytes(
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size + 1
                    )
                )
            ).value()
        }.toNot(
            throwError(),
            description: "Standard integer overflow is not expected to throw"
        )
    }

    func testNegativeIntegerThrows() {
        expect{
            try EthNumber(
                value: -1
            ).value()
        }.to(
            throwError(
                errorType: IntegerOutOfRange.self
            ),
            description: "Negative integers are considered invalid"
        )
    }

}