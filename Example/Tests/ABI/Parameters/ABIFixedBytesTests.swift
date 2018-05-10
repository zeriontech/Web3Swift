//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIFixedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class ABIFixedBytesTests: XCTestCase {

    func testEncodedBytesCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIFixedBytes(
                    origin: SimpleBytes(
                        bytes: [
                            0x01, 0x02
                        ]
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0x01, 0x02] + Array<UInt8>(repeating: 0x00, count: 30)
                )
            ),
            description: "Encoded fixed bytes are expected to be padded to the length of 32 with zeroes to the right"
        )
    }

    func testThrowsOnOverflow() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIFixedBytes(
                    origin: SimpleBytes(
                        bytes: Array<UInt8>(repeating: 0x00, count: 33)
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            throwError(errorType: IncorrectBytesLengthError.self),
            description: "Encoded fixed bytes are expected to throw on overflow"
        )
    }

    func testTailsAreEmpty() {
        expect{
            try ABIFixedBytes(
                origin: SimpleBytes(
                    bytes: [
                        0x01, 0x02
                    ]
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "Tails are expected to be empty"
        )
    }

}
