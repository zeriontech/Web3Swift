//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABITupleTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABITupleTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIBoolean(
                            origin: true
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "baz(uint32,bool)"
                            )
                        ),
                        ABIBoolean(
                            origin: true
                        )
                    ]
                ).tails(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000060" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000010" +
                        "62617A2875696E7433322C626F6F6C2900000000000000000000000000000000"
                )
            ),
            description: "ABI tuple is expected to encode heads of parameters followed by their tails"
        )
    }

    func testTailsAreEmpty() {
        func testTailsAreEmpty() {
            expect{
                try ABITuple(
                    parameters: [
                        ABIBoolean(
                            origin: true
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "baz(uint32,bool)"
                            )
                        ),
                        ABIBoolean(
                            origin: true
                        )
                    ]
                ).tails(offset: 0)
            }.to(
                beEmpty(),
                description: "Tails are expected to be empty"
            )
        }
    }

}
