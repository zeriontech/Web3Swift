//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TrailingCompactBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class TrailingCompactBytesTests: XCTestCase {

    func testCompactBytesPersist() {
        Array<
            (
                BytesScalar,
                Data
            )
        >(
            [
                (
                    SimpleBytes(
                        bytes: [0]
                    ),
                    Data(
                        bytes: [0]
                    )
                ),
                (
                    SimpleBytes(
                        bytes: [0, 1, 0, 1]
                    ),
                    Data(
                        bytes: [0, 1, 0, 1]
                    )
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try TrailingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    bytes
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

    func testBytesAreCompactedCorrectly() {
        Array<
            (
                BytesScalar,
                Data
            )
        >(
            [
                (
                    SimpleBytes(
                        bytes: [0, 0, 0]
                    ),
                    Data(
                        bytes: [0]
                    )
                ),
                (
                    SimpleBytes(
                        bytes: [0, 1, 0, 1, 0, 0, 0]
                    ),
                    Data(
                        bytes: [0, 1, 0, 1]
                    )
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try TrailingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    bytes
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

}
