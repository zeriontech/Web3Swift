//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// LeadingCompactBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class LeadingCompactBytesTests: XCTestCase {

    //swiftlint:disable operator_usage_whitespace
    func testPersistsCompactBytes() {
        Array<(BytesScalar, Array<UInt8>)>(
            [
                (
                    SimpleBytes(bytes: [0x00]),
                    Array<UInt8>([0x00])
                ),
                (
                    SimpleBytes(bytes: [0x01, 0x00, 0x01, 0x00]),
                    Array<UInt8>([0x01, 0x00, 0x01, 0x00])
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try LeadingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    Data(bytes: bytes)
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

    func testCorrectlyCompactedBytes() {
        Array<(BytesScalar, Array<UInt8>)>(
            [
                (
                    SimpleBytes(bytes: [0x00, 0x00, 0x00]),
                    Array<UInt8>([0x00])
                ),
                (
                    SimpleBytes(bytes: [0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00]),
                    Array<UInt8>([0x01, 0x00, 0x01, 0x00])
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try LeadingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    Data(bytes: bytes)
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

}
