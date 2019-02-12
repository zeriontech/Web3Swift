//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// RightZeroesPaddedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class RightZeroesPaddedBytesTests: XCTestCase {

    func testBytesArePaddedNumericallyCorrectly() {
        Array<
            (
                Data, Data
            )
        >(
            [
                (
                    Data(repeating: 0x00, count: 0),
                    Data(repeating: 0x00, count: 0)
                ),
                (
                    Data(repeating: 0x00, count: 1),
                    Data(repeating: 0x00, count: 32)
                ),
                (
                    Data(repeating: 0x00, count: 32),
                    Data(repeating: 0x00, count: 32)
                ),
                (
                    Data(repeating: 0x00, count: 33),
                    Data(repeating: 0x00, count: 64)
                )
            ]
        ).forEach{ initialBytes, paddedBytes in
            expect{
                try RightZeroesPaddedBytes(
                    origin: SimpleBytes(
                        bytes: initialBytes
                    ),
                    padding: 32
                ).value()
            }.to(
                equal(paddedBytes)
            )
        }
    }

    func testPaddingPersistsOrigin() {
        Array<String>(
            [
                "Hello",
                String(repeating: "i", count: 32),
                String(repeating: "i", count: 33)
            ]
        ).forEach{ prefix in
            expect{
                try String(
                    bytes: RightZeroesPaddedBytes(
                        origin: UTF8StringBytes(string: prefix),
                        padding: 32
                    ).value(),
                    encoding: .utf8
                )
            }.to(
                beginWith(prefix)
            )
        }
    }

}
