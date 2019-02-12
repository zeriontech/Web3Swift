//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersQuotientTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegersQuotientTests: XCTestCase {

    func testCorrectIntegerQuotientIsComputed() {
        expect{
            try IntegersQuotient(
                dividend: SimpleInteger(
                    integer: 204
                ),
                divisor: SimpleInteger(
                    integer: 5
                )
            ).value()
        }.to(
            equal(
                40
            ),
            description: "A correct quotient without decimal part is expected"
        )
    }

    func testIdentityHolds() {
        expect{
            try IntegersQuotient(
                dividend: SimpleInteger(
                    integer: Int.min
                ),
                divisor: SimpleInteger(
                    integer: 1
                )
            ).value()
        }.to(
            equal(
                Int.min
            ),
            description: "A divisor of 1 is expected to be an identity"
        )
    }

    func testDivisionByZeroThrows() {
        expect{
            try IntegersQuotient(
                dividend: SimpleInteger(
                    integer: Int.min
                ),
                divisor: SimpleInteger(
                    integer: 0
                )
            ).value()
        }.to(
            throwError(
                errorType: DivisionByZero.self
            ),
            description: "Division by 0 is expected to be an error"
        )
    }

    func testOverflowThrows() {
        expect{
            try IntegersQuotient(
                dividend: SimpleInteger(
                    integer: Int.min
                ),
                divisor: SimpleInteger(
                    integer: -1
                )
            ).value()
        }.to(
            throwError(
                errorType: IntegerOverflow.self
            ),
            description: "Int.min * (-1) is equivalent to Int.max + 1 in a two's complement representation. Thus it is expected to throw an error"
        )
    }

}