//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABINumberTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class DecodedABINumberTests: XCTestCase {

    func testPlainNumberIsDecodedCorrectly() {
        expect{
            try NaturalInteger(
                hex: DecodedABINumber(
                    abiMessage: ABIMessage(
                        message: "000000000000000000000000000000000000000000000000000000000000002a"
                    ),
                    index: 0
                )
            ).value()
        }.to(
            equal(
                42
            ),
            description: "ABI number is expected to persist"
        )
    }

    func testNumberAtSecondPositionIsDecodedCorrectly() {
        expect{
            try NaturalInteger(
                hex: DecodedABINumber(
                    abiMessage: ABIMessage(
                        message: [
                            "0000000000000000000000000000000000000000000000000000000000000040",
                            "000000000000000000000000000000000000000000000000000000000000002a",
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
                    index: 1
                )
            ).value()
        }.to(
            equal(
                42
            ),
            description: "ABI number at second position is expected to persist"
        )
    }

}
