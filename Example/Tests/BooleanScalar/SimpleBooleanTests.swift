//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleBooleanTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SimpleBooleanTests: XCTestCase {

    func testClosureWrappedBooleanPersists() {
        Array<Bool>(
            [
                true,
                false
            ]
        ).forEach{ bool in
            expect{
                try SimpleBoolean{ bool }.value()
            }.to(
                equal(
                    bool
                ),
                description: "Bool value is expected to persist"
            )
        }
    }

    func testDirectValuePersists() {
        Array<Bool>(
            [
                true,
                false
            ]
        ).forEach{ bool in
            expect{
                try SimpleBoolean(bool: bool).value()
            }.to(
                equal(
                    bool
                ),
                description: "Bool value is expected to persist"
            )
        }
    }

    func testErrorsPersist() {
        expect{
            try SimpleBoolean{
                throw UnknownError()
            }.value()
        }.to(
            throwError(errorType: UnknownError.self),
            description: "Errors thrown by the closure are expected to persist"
        )
    }

}
