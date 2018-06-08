//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// JSONResultStringTests.swift
//
// Created by Timofey Solonin on 26/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class JSONResultStringTests: XCTestCase {

    func testCorrectStringIsTaken() {
        expect{
            try JSONResultString(
                json: SimpleProcedure(
                    json: JSON(
                        [
                            "result" : "42"
                        ]
                    )
                )
            ).value()
        }.to(
            equal(
                "42"
            ),
            description: "Correct string is expected to be fetched"
        )
    }

    func testNotAStringInResultThrows() {
        expect{
            try JSONResultString(
                json: SimpleProcedure(
                    json: JSON(
                        [
                            "result" : 42
                        ]
                    )
                )
            ).value()
        }.to(
            throwError(
                errorType: InvalidTypeError<String>.self
            ),
            description: "When value is not a string the error is expected"
        )
    }

    func testAbsentResultInRootThrows() {
        expect{
            try JSONResultString(
                json: SimpleProcedure(
                    json: JSON(
                        [
                            "hello" : "world",
                            "other" : [
                                "result" : "42"
                            ]
                        ]
                    )
                )
            ).value()
        }.to(
            throwError(
                errorType: InvalidTypeError<String>.self
            ),
            description: "When result is not present or present somewhere other than the root and error is expected"
        )
    }

}