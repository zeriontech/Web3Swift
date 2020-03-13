//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIBooleanTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class ABIBooleanTests: XCTestCase {

    func testTrueHeads() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIBoolean(
                    origin: true
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    Array<UInt8>(repeating: 0x00, count: 31) + [0x01]
                )
            ),
            description: "True is expected to be equal to ABI encoding of 1"
        )
    }

    func testFalseHeads() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIBoolean(
                    origin: false
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    Array<UInt8>(repeating: 0x00, count: 32)
                )
            ),
            description: "True is expected to be equal to ABI encoding of 0"
        )
    }

    func testEmptyTail() {
        Array<ABIEncodedParameter>(
            [
                ABIBoolean(
                    origin: true
                ),
                ABIBoolean(
                    origin: false
                )
            ]
        ).forEach{ parameter in
            expect{
                try parameter.tails(offset: 0)
            }.to(
                beEmpty(),
                description: "Boolean tails is expected to be empty"
            )
        }
    }

}
