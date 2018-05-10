//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// LastBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class LastBytesTests: XCTestCase {

    func testTakesLastBytesCorrectlyWhenSufficient() {
        expect{
            try LastBytes(
                origin: SimpleBytes(
                    bytes: [
                        0x01, 0x02, 0x03, 0x04, 0x05
                    ]
                ),
                length: 3
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x03, 0x04, 0x05
                    ]
                )
            )
        )
    }

    func testTakesLastBytesCorrectlyWhenInsufficient() {
        expect{
            try LastBytes(
                origin: SimpleBytes(
                    bytes: [
                        0x01, 0x02
                    ]
                ),
                length: 3
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x01, 0x02
                    ]
                )
            )
        )
    }

}
