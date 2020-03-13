//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FirstBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class FirstBytesTests: XCTestCase {

    func testTakesFirstBytesCorrectlyWhenSufficient() {
        expect{
            try FirstBytes(
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
                    [
                        0x01, 0x02, 0x03
                    ]
                )
            )
        )
    }

    func testTakesFirstBytesCorrectlyWhenInsufficient() {
        expect{
            try FirstBytes(
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
                    [
                        0x01, 0x02
                    ]
                )
            )
        )
    }

}
