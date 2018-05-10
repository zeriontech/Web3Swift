//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIMessageTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class ABIMessageTests: XCTestCase {

    func testEmptyMessageThrows() {
        expect{
            try ABIMessage(
                message: SimpleBytes(
                    bytes: []
                )
            ).value()
        }.to(
            throwError(errorType: IndexOtOfBoundsError.self),
            description: "Valid abi message may not be empty"
        )
    }

    func testIncorrectMessageElementsThrow() {
        expect{
            try ABIMessage(
                message: "3078343037643733643861343965656238356433326366343635353037646437" +
                    "31643530373130306334000000000000000000000000000000000000000000"
            ).value()[1].value()
        }.to(
            throwError(errorType: IncorrectBytesLengthError.self),
            description: "Pieces of a valid abi message must be of length 32"
        )
    }

    func testCorrectMessageIsSegmentedCorrectly() {
        expect{
            try ABIMessage(
                message: [
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633300000000000000000000000000000000000000000000",
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633400000000000000000000000000000000000000000000"
                ].reduce("", +)
            ).value().map{
                try $0.value().toHexString()
            }
        }.to(
            equal(
                [
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633300000000000000000000000000000000000000000000",
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633400000000000000000000000000000000000000000000"
                ]
            ),
            description: "Correct message is expected to persist"
        )
    }

}
