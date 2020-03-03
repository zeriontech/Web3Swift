//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegerBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegerBytesTests: XCTestCase {

    func testMemory() {
        expect{
            MemoryLayout<UInt>.size
        }.to(
            equal(8)
        )
    }

    func testLittleEndianInteger() {
        expect{
            try IntegerBytes(
                value: Int(1).littleEndian
            ).value()
        }.to(
            equal(
                Data(
                    [0x01] + Array(repeating: 0x00, count: MemoryLayout<Int>.size - 1)
                )
            ),
            description: "Integer bytes are expected to respect endianness"
        )
    }

    func testBigEndianInteger() {
        expect{
            try IntegerBytes(
                value: Int(1).bigEndian
            ).value()
        }.to(
            equal(
                Data(
                    Array(repeating: 0x00, count: MemoryLayout<Int>.size - 1) + [0x01]
                )

            ),
            description: "Integer bytes are expected to respect endianness"
        )
    }

}
