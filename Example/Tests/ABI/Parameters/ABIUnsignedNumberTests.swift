//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIUnsignedNumberTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIUnsignedNumberTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIUnsignedNumber(
                    origin: BigEndianNumber(
                        bytes: BytesFromHexString(
                            hex: "12345678"
                        )
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000012345678"
                )
            ),
            description: "Encoded unsigned number is expected to be padded to the length of 32 with zeroes to the left"
        )
    }

    func testEncodesTailsCorrectly() {
        expect{
            try ABIUnsignedNumber(
                origin: BigEndianNumber(
                    bytes: BytesFromHexString(
                        hex: "12345678"
                    )
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "T"
        )
    }

}
