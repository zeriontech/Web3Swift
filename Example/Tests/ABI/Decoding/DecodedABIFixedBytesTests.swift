//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABIFixedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class DecodedABIFixedBytesTests: XCTestCase {

    func testPlainFixBytesAreDecodedCorrectly() {
        expect{
            try DecodedABIFixedBytes(
                abiMessage: ABIMessage(
                    message: "0001020300000000000000000000000000000000000000000000000000000000"
                ),
                length: 4,
                index: 0
            ).value().toHexString()
        }.to(
            equal(
                "00010203"
            ),
            description: "ABI fixed bytes are expected to persist"
        )
    }

    func testFixedBytesAtSecondPositionAreDecodedCorrectly() {
        expect{
            try DecodedABIFixedBytes(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0001020300000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "cc00000000000000000000000000000000000000000000000000000000000000",
                        "bb00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "aa00000000000000000000000000000000000000000000000000000000000000",
                        "ff00000000000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                length: 4,
                index: 1
            ).value().toHexString()
        }.to(
            equal(
                "00010203"
            ),
            description: "ABI fixed bytes at second position are expected to persist"
        )
    }

}
