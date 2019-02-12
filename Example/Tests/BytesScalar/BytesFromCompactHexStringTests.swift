//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BytesFromCompactHexStringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class BytesFromCompactHexStringTests: XCTestCase {

    func testNonAmbiguousPrefixedHexStrings() {
        Array<(String, [UInt8])>(
            [
                ("0x", []),
                ("0x00", [0x00]),
                ("0x01", [0x01]),
                ("0x03ff", [0x03, 0xff]),
                ("0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e", [0xcd, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BytesFromCompactHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Non ambiguous prefixed hex string is expected to produce valid bytes array"
            )
        }
    }

    func testAmbiguousPrefixedHexStrings() {
        Array<(String, [UInt8])>(
            [
                ("0x0", [0x00]),
                ("0x1", [0x01]),
                ("0x3ff", [0x03, 0xff]),
                ("0xD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e", [0x0d, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BytesFromCompactHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Ambiguous prefixed hex string is expected to produce valid bytes array by appending a leading zero"
            )
        }
    }

    func testNonAmbiguousUnprefixedHexStrings() {
        Array<(String, [UInt8])>(
            [
                ("", []),
                ("00", [0x00]),
                ("01", [0x01]),
                ("03ff", [0x03, 0xff]),
                ("cD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e", [0xcd, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BytesFromCompactHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Non ambiguous unprefixed hex string is expected to produce valid bytes array"
            )
        }
    }

    func testAmbiguousUnprefixedHexStrings() {
        Array<(String, [UInt8])>(
            [
                ("0", [0x00]),
                ("1", [0x01]),
                ("3ff", [0x03, 0xff]),
                ("D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e", [0x0d, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BytesFromCompactHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Ambiguous prefixed hex string is expected to produce valid bytes array by appending a leading zero"
            )
        }
    }

    func testInvalidHexStrings() {
        Array<String>(
            [
                "not a hex string",
                "0x 3",
                "-0x01",
                "01x01",
                "1x00",
                "10x00"
            ]
        ).forEach{ notAHexString in
            expect{
                try BytesFromCompactHexString(
                    hex: SimpleString(
                        string: notAHexString
                    )
                ).value()
            }.to(
                throwError(),
                description: "String \(notAHexString) which does not represent any hex is expected to throw"
            )
        }
    }

}
