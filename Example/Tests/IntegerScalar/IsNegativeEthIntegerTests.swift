//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IsNegativeEthIntegerTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class IsNegativeEthIntegerTests: XCTestCase {

    func testNegativeNumbersAreConsideredNegative() {
        Array<
            Array<UInt8>
        >(
            [
                [0x80] + Array(
                    repeating: 0x00,
                    count: 31
                ),
                [0xff] + Array(
                    repeating: 0xff,
                    count: 31
                )
            ]
        ).forEach{ bytes in
            expect{
                try IsNegativeEthInteger(
                    hex: SimpleBytes(
                        bytes: bytes
                    )
                ).value()
            }.to(
                equal(
                    true
                ),
                description: "Number \(bytes.toHexString()) is expected to be considered negative"
            )
        }
    }

    func testNonNegativeNumbersAreConsideredNonNegative() {
        Array<
            Array<UInt8>
        >(
            [
                [0x7f] + Array(
                    repeating: 0xff,
                    count: 31
                ),
                [0x00],
                [0x01],
                Array(
                    repeating: 0xff,
                    count: MemoryLayout<Int>.size
                ),
                Array(
                    repeating: 0xff,
                    count: 31
                )
            ]
        ).forEach{ bytes in
            expect{
                try IsNegativeEthInteger(
                    hex: SimpleBytes(
                        bytes: bytes
                    )
                ).value()
            }.to(
                equal(
                    false
                ),
                description: "Number \(bytes.toHexString()) is considered to be non negative"
            )
        }
    }

}