//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ASCIIStringBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ASCIIStringBytesTests: XCTestCase {

    func testGivesCorrectASCIIRepresentation() {
        expect{
            try ASCIIStringBytes(
                string: SimpleString(
                    string: "hello"
                )
            ).value()
        }.to(
            equal(
                Data(
                    hex: "68656c6c6f"
                )
            ),
            description: "ascii representation is expected to persist"
        )
    }

    func testNonASCIICharacterThrows() {
        expect{
            try ASCIIStringBytes(
                string: SimpleString(
                    string: "∆"
                )
            ).value()
        }.to(
            throwError(errorType: NotAnASCIIScalarError.self),
            description: "Non ascii characters are expected to cause an error"
        )
    }

}
