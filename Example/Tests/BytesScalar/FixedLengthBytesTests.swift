//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FixedLengthBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class FixedLengthBytesTests: XCTestCase {

    func testProperlyFixedLengthBytes() {
        Array<Int>([0, 20]).forEach{ length in
            expect{
                try FixedLengthBytes(
                    origin: SimpleBytes(
                        bytes: Array(
                            repeating: 0x00,
                            count: length
                        )
                    ),
                    length: length
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: Array(
                            repeating: 0x00,
                            count: length
                        )
                    )
                ),
                description: "Fixed length bytes are expected to persist"
            )
        }
    }

    func testIncorrectLengthBytes() {
        Array<Int>([0, 20]).forEach{ length in
            expect{
                try FixedLengthBytes(
                    origin: SimpleBytes(
                        bytes: Array(
                            repeating: 0x00,
                            count: length
                        )
                    ),
                    length: length + 1
                ).value()
            }.to(
                throwError(errorType: IncorrectBytesLengthError.self),
                description: "Fixed length bytes which appear to be of different length are expected to throw"
            )
        }
    }

}
