//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIVariableBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIVariableBytesTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIVariableBytes(
                    origin: BytesFromHexString(
                        hex: "4d00000000000000000000000000000000000000000000000000000000000012" +
                            "11"
                    )
                ).heads(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000020"
                )
            ),
            description: "ABI variable bytes are expected to encode length to tails correctly"
        )
    }

    func testEncodesTailsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIVariableBytes(
                    origin: BytesFromHexString(
                        hex: "4d00000000000000000000000000000000000000000000000000000000000012" +
                            "11"
                    )
                ).tails(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000021" +
                        "4d00000000000000000000000000000000000000000000000000000000000012" +
                        "1100000000000000000000000000000000000000000000000000000000000000"
                )
            ),
            description: "ABI variable bytes are expected to encode length to tails correctly"
        )
    }

}
