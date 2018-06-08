//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TernaryIntegerTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class TernaryIntegerTests: XCTestCase {

    func testTrueLeadsToThen() {
        expect{
            try TernaryInteger(
                if: SimpleBoolean(
                    bool: true
                ),
                then: SimpleInteger(
                    integer: 42
                ),
                else: SimpleInteger(
                    integer: 0
                )
            ).value()
        }.to(
            equal(
                42
            ),
            description: "If boolean evaluates to true `then` statement is expected to be invoked"
        )
    }

    func testFalseLeadsToElse() {
        expect{
            try TernaryInteger(
                if: SimpleBoolean(
                    bool: false
                ),
                then: SimpleInteger(
                    integer: 42
                ),
                else: SimpleInteger(
                    integer: 0
                )
            ).value()
        }.to(
            equal(
                0
            ),
            description: "If boolean evaluates to false `else` statement is expected to be invoked"
        )
    }

}