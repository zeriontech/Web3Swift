//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FirstByteTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class FirstByteTests: XCTestCase {

    func testFirstByteIsTakenCorrectly() {
        expect{
            try FirstByte(
                origin: SimpleBytes(
                    bytes: [42, 43]
                )
            ).value()
        }.to(
            equal(
                42
            ),
            description: "Correct first byte is expected"
        )
    }

    func testEmptyBytesThrow() {
        expect{
            try FirstByte(
                origin: SimpleBytes(
                    bytes: []
                )
            ).value()
        }.to(
            throwError(
                errorType: IndexOutOfBoundsError.self
            ),
            description: "Empty collection is expected to throw"
        )
    }

}