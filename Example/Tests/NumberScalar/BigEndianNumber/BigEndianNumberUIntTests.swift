//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BigEndianNumberUIntTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class BigEndianNumberUIntTests: XCTestCase {

    func testUIntConversionFromUInt() {
        Array<UInt>(
            [
                1,
                1023,
                4294967295
            ]
        ).forEach{ uint in
            expect{
                try BigEndianNumber(uint: uint).uint()
            }.to(
                equal(uint),
                description: "Value of a number is expected to persist"
            )
        }
    }

    func testUIntConversionFromHex() {
        Array<
            (
                String,
                UInt
            )
        >(
            [
                ("0x01", 1),
                ("0x03ff", 1023),
                ("0xffffffff", 4294967295)
            ]
        ).forEach{ hex, uint in
            expect{
                try BigEndianNumber(
                    hex: SimpleString(
                        string: hex
                    )
                ).uint()
            }.to(
                equal(uint),
                description: "Value of a number from hex is expected to persist"
            )
        }
    }

    func testUIntConversionFromBytes() {
        Array<
            (
                Array<UInt8>,
                UInt
            )
        >(
            [
                ([0x01], 1),
                ([0x03, 0xff], 1023),
                ([0xff, 0xff, 0xff, 0xff], 4294967295)
            ]
        ).forEach{ bytes, uint in
            expect{
                try BigEndianNumber(
                    bytes: SimpleBytes(
                        bytes: bytes
                    )
                ).uint()
            }.to(
                equal(uint),
                description: "Value of a number from bytes is expected to persist"
            )
        }
    }

    func testOverflow() {
        expect{
            try BigEndianNumber(
                bytes: SimpleBytes(
                    bytes: [0x01] + Array<UInt8>(
                        repeating: 0x00,
                        count: MemoryLayout<UInt>.size
                    )
                )
            ).uint()
        }.to(
            throwError(),
            description: "A number of \(MemoryLayout<UInt>.size + 1) bytes is expected to be considered an overflow"
        )
    }

    func testOverflowCeil() {
        expect{
            try BigEndianNumber(
                bytes: SimpleBytes(
                    bytes: Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<UInt>.size
                    )
                )
            ).uint()
        }.toNot(
            throwError(),
            description: "A number of \(MemoryLayout<UInt>.size) 0xff bytes is expected to be the overflow limit"
        )
    }

}
