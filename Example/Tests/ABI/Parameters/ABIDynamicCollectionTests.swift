//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIDynamicCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIDynamicCollectionTests: XCTestCase {

    func testDynamicCollectionEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIDynamicCollection(
                    parameters: [
                        ABIString(
                            origin: SimpleString(
                                string: "1"
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "2"
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "3"
                            )
                        )
                    ]
                ).heads(offset: 1)
            ).value().toHexString()
        }.to(
            equal(
                Data(
                    bytes: Array<UInt8>(repeating: 0x00, count: 31) + [0x20]
                ).toHexString()
            ),
            description: "ABI dynamic collection is expected to encode length to tails correctly"
        )
    }

    func testDynamicCollectionEncodesTailsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIDynamicCollection(
                    parameters: [
                        ABIBoolean(origin: true),
                        ABIBoolean(origin: false),
                        ABIBoolean(origin: true)
                    ]
                ).tails(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000001"
                )
            ),
            description: "ABI dynamic collection is expect to encode tails correctly"
        )
    }

}
