//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// PrefixedStringTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class PrefixedStringTests: XCTestCase {

    func testPrefixesUnprefixedStrings() {
        Array<String>(
            [
                "987654321",
                "hello",
                ""
            ]
        ).forEach{ string in
            expect{
                try PrefixedString(
                    origin: SimpleString(
                        string: string
                    ),
                    prefix: SimpleString(
                        string: "1234"
                    )
                ).value()
            }.to(
                equal("1234\(string)"),
                description: "String \(string) is expected to be prefixed by 1234"
            )
        }
    }

    func testDoesntPrefixPrefixedStrings() {
        Array<String>(
            [
                "1234",
                "123456789",
                "1234hello"
            ]
        ).forEach{ string in
            expect{
                try PrefixedString(
                    origin: SimpleString(
                        string: string
                    ),
                    prefix: SimpleString(
                        string: "1234"
                    )
                ).value()
            }.to(
                equal(string),
                description: "String \(string) is already prefixed"
            )
        }
    }

}
