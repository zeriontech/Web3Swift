//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UTF8StringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UTF8StringTests: XCTestCase {

    func testNonUTF8BytesThrow() {
        expect{
            try UTF8String(
                bytes: SimpleBytes(
                    bytes: [
                        0xc0
                    ]
                )
            ).value()
        }.to(
            throwError(errorType: NotUTF8BytesError.self),
            description: "Bytes that do not represent a valid utf8 string are expected to throw"
        )
    }

    func testValidUTF8BytesProduceAString() {
        expect{
            try UTF8String(
                bytes: UTF8StringBytes(
                    string: "κόσμε"
                )
            ).value()
        }.to(
            equal(
                "κόσμε"
            ),
            description: "Valid utf8 string is expected to be correctly constructed from its bytes"
        )
    }

}
