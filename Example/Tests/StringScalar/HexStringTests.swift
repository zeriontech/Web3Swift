//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// HexStringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class HexStringTests: XCTestCase {

    func testValidPrefixedHexString() {
        Array<String>(
            [
                "0x00",
                "0x01",
                "0x03ff",
                "0x0D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try HexString(
                    hex: hex
                ).value()
            }.to(
                equal(hex),
                description: "Valid prefixed hex strings are expected to persist"
            )
        }
    }

    func testValidUnprefixedHexString() {
        Array<String>(
            [
                "00",
                "01",
                "03ff",
                "0D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try HexString(
                    hex: hex
                ).value()
            }.to(
                equal(hex),
                description: "Valid prefixed hex strings are expected to persist"
            )
        }
    }

    func testAmbiguousPrefixedHexString() {
        Array<String>(
            [
                "0x0",
                "0x1",
                "0x3ff",
                "0xD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try HexString(
                    hex: hex
                ).value()
            }.to(
                throwError(errorType: AmbiguousHexStringError.self),
                description: "Ambiguous prefixed hex strings are expected to throw"
            )
        }
    }

    func testAmbiguousUnprefixedHexString() {
        Array<String>(
            [
                "0",
                "1",
                "3ff",
                "D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try HexString(
                    hex: hex
                ).value()
            }.to(
                throwError(errorType: AmbiguousHexStringError.self),
                description: "Ambiguous unprefixed hex strings are expected to throw"
            )
        }
    }

    func testNotAHexString() {
        expect{
            try HexString(
                hex: "not a hex string"
            ).value()
        }.to(
            throwError(errorType: IncorrectHexCharacterError.self),
            description: "String that doesn't describe a hex is expected to throw."
        )
    }

}
