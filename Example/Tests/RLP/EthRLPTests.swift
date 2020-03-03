//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthRLPTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EthRLPTests: XCTestCase {

    func testEncodesZeroCorrectly() {
        expect{
            try EthRLP(
                number: EthNumber(
                    value: 0
                )
            ).value()
        }.to(
            equal(
                Data(
                    [0x80]
                )
            ),
            description: "EthRLP encoded 0 is expected to match empty byte RLP encoding (0x80)"
        )
    }

    func testEncodingPersistsForOtherValues() {
        Array<
            (
                Int,
                Array<UInt8>
            )
        >(
            [
                (1, [0x01]),
                (15, [0x0f]),
                (1024, [0x82, 0x04, 0x00])
            ]
        ).forEach{ value, bytes in
            expect{
                try EthRLP(
                    number: EthNumber(
                        value: value
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes
                    )
                ),
                description: "Value \(value) is expected to be encoded as \(bytes)"
            )
        }
    }

}
