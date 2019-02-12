//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TernaryTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class TernaryTests: XCTestCase {

    func testTrueLeadsToThen() {
        expect{
            try Ternary(
                if: SimpleBoolean(
                    bool: true
                ),
                then: true,
                else: false
            ).value()
        }.to(
            equal(
                true
            ),
            description: "If boolean evaluates to true `then` statement is expected to be invoked"
        )
    }

    func testFalseLeadsToElse() {
        expect{
            try Ternary(
                if: SimpleBoolean(
                    bool: false
                ),
                then: true,
                else: false
            ).value()
        }.to(
            equal(
                false
            ),
            description: "If boolean evaluates to false `else` statement is expected to be invoked"
        )
    }

}