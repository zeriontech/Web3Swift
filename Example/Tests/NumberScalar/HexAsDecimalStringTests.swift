//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// HexAsDecimalStringTests.swift
//
// Created by Timofey Solonin on 24/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class HexAsDecimalStringTests: XCTestCase {

    func testHexNumberConvertsToAValidDecimalString() {
        Array<
            (
                hex: Array<UInt8>,
                decimal: String
            )
        >(
            [
                (
                    hex: [
                        0x00
                    ],
                    decimal: "0"
                ),
                (
                    hex: [
                        0x01
                    ],
                    decimal: "1"
                ),
                (
                    hex: [
                        0xff
                    ],
                    decimal: "255"
                ),
                (
                    hex: [
                        0xff, 0xff
                    ],
                    decimal: "65535"
                ),
                (
                    hex: [0x7f] + Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    decimal: "\(Int.max)"
                )
            ]
        ).forEach{ hex, decimal in
            expect{
                try HexAsDecimalString(
                    hex: SimpleBytes(
                        bytes: hex
                    )
                ).value()
            }.to(
                equal(
                    decimal
                ),
                description: "Hexadecimal \(hex) is expected to match decimal string \(decimal)"
            )
        }
    }

    func testUInt256MaxConvertsToAValidString() {
        expect{
            try HexAsDecimalString(
                hex: SimpleBytes(
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: 32
                    )
                )
            ).value()
        }.to(
            equal(
                "115792089237316195423570985008687907853269984665640564039457584007913129639935"
            )
        )
    }

}