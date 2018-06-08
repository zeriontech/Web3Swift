//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthIntegerTests.swift
//
// Created by Timofey Solonin on 22/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthIntegerTests: XCTestCase {

    func testValidCompactIntegersAreInterpretedCorrectly() {
        Array<
            (
                bytes: [UInt8],
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
                    bytes: [
                        0x7f
                    ] + Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    integer: Int.max
                ),
                (
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: 32
                    ),
                    integer: -1
                ),
                (
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: 24
                    ) + [
                        0x80
                    ] +  Array<UInt8>(
                        repeating: 0x00,
                        count: 7
                    ),
                    integer: Int.min
                )
            ]
        ).forEach{ bytes, integer in
            expect{
                try EthInteger(
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

    func testValidPaddedIntegersAreInterpretedCorrectly() {
        Array<
            (
                bytes: [UInt8],
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
                    bytes: [
                        0x7f
                    ] + Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    integer: Int.max
                ),
                (
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: 32
                    ),
                    integer: -1
                ),
                (
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: 24
                    ) + [
                        0x80
                    ] +  Array<UInt8>(
                        repeating: 0x00,
                        count: 7
                    ),
                    integer: Int.min
                )
            ]
        ).forEach{ bytes, integer in
            expect{
                try EthInteger(
                    hex: LeftZeroesPaddedBytes(
                        origin: SimpleBytes(
                            bytes: bytes
                        ),
                        length: 32
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

    func testPlatformIntegerSizeIsNotInterpretedIncorrectly() {
        expect{
            try EthInteger(
                hex: SimpleBytes(
                    bytes: GeneratedCollection(
                        element: 0xff,
                        times: MemoryLayout<Int>.size
                    )
                )
            ).value()
        }.to(
            throwError(
                errorType: IntegerOutOfRange.self
            ),
            description: "Platform size representation of -1 is not expected to be equivalent to int256 representation"
        )
    }

    func testOverflowThrows() {
        expect{
            try EthInteger(
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