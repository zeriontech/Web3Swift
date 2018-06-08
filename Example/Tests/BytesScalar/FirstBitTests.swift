//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FirstBitTests.swift
//
// Created by Timofey Solonin on 22/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class FirstBitTests: XCTestCase {

    func testFirstBitFrom0To127() {
        (0...127).forEach{ value in
            expect{
                try FirstBit(
                    value: BigEndianInteger(
                        origin: SimpleInteger(
                            integer: value
                        )
                    )
                ).value()
            }.to(
                equal(
                    0
                ),
                description: "First bit of big endian of 0...127 is expected to be 0"
            )
        }
    }

    func testFirstBitFrom128To255() {
        (128...255).forEach{ value in
            expect{
                try FirstBit(
                    value: BigEndianInteger(
                        origin: SimpleInteger(
                            integer: value
                        )
                    )
                ).value()
            }.to(
                equal(
                    1
                ),
                description: "First bit of big endian of 128...255 is expected to be 1"
            )
        }
    }

}