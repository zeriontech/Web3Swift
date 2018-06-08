//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersEqualityTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegersEqualityTests: XCTestCase {

    func testEqualIntegersAreConsideredEqual() {
        Array<Int>(
            [
                0,
                1,
                -1,
                Int.min,
                Int.max
            ]
        ).forEach{ value in
            expect{
                try IntegersEquality(
                    lhs: SimpleInteger(
                        integer: value
                    ),
                    rhs: SimpleInteger(
                        integer: value
                    )
                ).value()
            }.to(
                equal(
                    true
                ),
                description: "Value \(value) is expected to be equal to itself"
            )
        }
    }

    func testUnequalIntegersAreConsideredUnequal() {
        expect{
            try IntegersEquality(
                lhs: SimpleInteger(
                    integer: 42
                ),
                rhs: SimpleInteger(
                    integer: -42
                )
            ).value()
        }.to(
            equal(
                false
            ),
            description: "Unequal integers are expected to be considered unequal"
        )
    }

}