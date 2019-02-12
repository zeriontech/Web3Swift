//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// HexPrefixedStringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class HexPrefixedStringTests: XCTestCase {

    func testPrefixesUnprefixedStrings() {
        Array<String>(
            [
                "x0",
                "hello",
                "123",
                ""
            ]
        ).forEach{ string in
            expect{
                try HexPrefixedString(
                    origin: SimpleString(
                        string: string
                    )
                ).value()
            }.to(
                equal("0x\(string)"),
                description: "String \(string) is expected to be prefixed by 0x"
            )
        }
    }

    func testDoesntPrefixPrefixedStrings() {
        Array<String>(
            [
                "0x",
                "0xhello",
                "0x123"
            ]
        ).forEach{ string in
            expect{
                try HexPrefixedString(
                    origin: SimpleString(
                        string: string
                    )
                ).value()
            }.to(
                equal(string),
                description: "String \(string) is already prefixed"
            )
        }
    }

}
