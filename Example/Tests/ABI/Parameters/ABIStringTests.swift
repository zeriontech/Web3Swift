//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIStringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIStringTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIString(
                    origin: SimpleString(
                        string: "baz(uint32,bool)"
                    )
                ).heads(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000020"
                )
            ),
            description: "ABI string is expected to encode length to tails correctly"
        )
    }

    func testEncodesTailsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIString(
                    origin: SimpleString(
                        string: "baz(uint32,bool)"
                    )
                ).tails(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000010" +
                        "62617A2875696E7433322C626F6F6C2900000000000000000000000000000000"
                )
            ),
            description: "ABI string tails is expected to be encoded as ABI variable bytes encoding of utf8 interpretation of the string"
        )
    }

}
