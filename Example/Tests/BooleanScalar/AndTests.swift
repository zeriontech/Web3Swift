//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// AndTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class AndTests: XCTestCase {

    func testAllTruthsAreEqualToTruth() {
        expect{
            try And(
                conditions: [
                    true,
                    true,
                    true
                ]
            ).value()
        }.to(
            equal(
                true
            ),
            description: "All truths are expected to be true"
        )
    }

    func testSingleFalseCompromisesTruth() {
        expect{
            try And(
                conditions: [
                    true,
                    true,
                    false,
                    true
                ]
            ).value()
        }.to(
            equal(
                false
            ),
            description: "Single false is expected to produce a false"
        )
    }

    func testAllFalsesAreEqualToFalse() {
        expect{
            try And(
                conditions: [
                    false,
                    false,
                    false
                ]
            ).value()
        }.to(
            equal(
                false
            ),
            description: "All falses are expected to be false"
        )
    }

    func testSingleConditionThrows() {
        expect{
            try And(
                conditions: [
                    true
                ]
            ).value()
        }.to(
            throwError(
                errorType: IndexOutOfBoundsError.self
            ),
            description: "At least two conditions are expected for a valid and"
        )
    }

    func testEmptyConditionThrows() {
        expect{
            try And(
                conditions: [] as [Bool]
            ).value()
        }.to(
            throwError(
                errorType: IndexOutOfBoundsError.self
            ),
            description: "At least two conditions are expected for a valid and"
        )
    }

    func testTrueLhsAndRhsAreTrue() {
        expect{
            try And(
                lhs: true,
                rhs: true
            ).value()
        }.to(
            equal(
                true
            ),
            description: "If lhs and rhs is true than And is expected to be true"
        )
    }

    func testOtherLhsAndRhsAreFalse() {
        Array
        <
            (
                Bool,
                Bool
            )
        >(
            [
                (
                    true,
                    false
                ),
                (
                    false,
                    true
                ),
                (
                    false,
                    false
                )
            ]
        ).forEach{ lhs, rhs in
            expect{
                try And(
                    lhs: lhs,
                    rhs: rhs
                ).value()
            }.to(
                equal(
                    false
                ),
                description: "If lhs and rhs are not equal to true than And is expected to be false"
            )
        }
    }
    
    func testScalarConditionNotThrows() {
        expect{
            try And(
                lhs: True(),
                rhs: True()
            ).value()
        }.to(
            equal(true),
            description: "If lhs and rhs are equal to true than And is expected to be true"
        )
    }

}
