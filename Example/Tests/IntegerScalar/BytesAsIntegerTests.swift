//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BytesAsIntegerTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class BytesAsIntegerTests: XCTestCase {

    func testCompactBytesAreCorrectlyInterpreted() {
        Array<
            (
                bytes: Array<UInt8>,
                integer: Int
            )
        >(
            [
                (
                    bytes: [0x00],
                    integer: 0
                ),
                (
                    bytes: [0x01],
                    integer: 1
                ),
                (
                    bytes: Array(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size
                    ),
                    integer: -1
                ),
                (
                    bytes: [
                        0x7f
                    ] + Array(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    integer: Int.max
                ),
                (
                    bytes: [
                        0x80
                    ] + Array(
                        repeating: 0x00,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    integer: Int.min
                )
            ]
        ).forEach{ bytes, integer in
            expect{
                try BytesAsInteger(
                    hex: SimpleBytes(
                        bytes: bytes
                    )
                ).value()
            }.to(
                equal(
                    integer
                ),
                description: "Bytes \(bytes.toHexString()) are expected to represent integer \(integer)"
            )
        }
    }

    func testIntegersAsBytesArePersistent() {
        [
            0,
            1,
            -1,
            Int.max,
            Int.min
        ].forEach{ integer in
            expect{
                try BytesAsInteger(
                    hex: IntegerBytes(
                        value: BigEndianInteger(
                            origin: SimpleInteger(
                                integer: integer
                            )
                        )
                    )
                ).value()
            }.to(
                equal(
                    integer
                ),
                description: "Integer \(integer) is expected to persist"
            )
        }
    }

    func testOverflowThrows() {
        expect{
            try BytesAsInteger(
                hex: ConcatenatedBytes(
                    bytes: [
                        SimpleBytes(
                            bytes: [0x01]
                        ),
                        SimpleBytes(
                            bytes: GeneratedCollection(
                                element: 0x00,
                                times: MemoryLayout<Int>.size
                            )
                        )
                    ]
                )
            ).value()
        }.to(
            throwError(
                errorType: IntegerBytesOverflowError.self
            ),
            description: "Such bytes are considered to be a lower bound of an overflow"
        )
    }

}