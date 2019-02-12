//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABIVariableBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class DecodedABIVariableBytesTests: XCTestCase {

    func testPlainBytesAreDecodedCorrectly() {
        expect{
            try DecodedABIVariableBytes(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000020",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "68656c6c6f000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 0
            ).value().toHexString()
        }.to(
            equal(
                "68656c6c6f"
            ),
            description: "ABI variable bytes are expected to persist"
        )
    }

    func testBytesAtSecondPositionAreDecodedCorrectly() {
        expect{
            try DecodedABIVariableBytes(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000160",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "cc00000000000000000000000000000000000000000000000000000000000000",
                        "bb00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "aa00000000000000000000000000000000000000000000000000000000000000",
                        "ff00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "68656c6c6f000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 1
            ).value().toHexString()
        }.to(
            equal(
                "68656c6c6f"
            ),
            description: "ABI string at second position is expected to persist"
        )
    }

}
