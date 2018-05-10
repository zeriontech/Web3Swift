//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SizeConstrainedCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SizeConstrainedCollectionTests: XCTestCase {

    func testUnderflowThrows() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            throwError(errorType: IndexOtOfBoundsError.self),
            description: "Underflow is expected to error out"
        )
    }

    func testMinimalSizePersists() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3, 4
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            equal(
                [1, 2, 3, 4]
            ),
            description: "Minimal size collection is expected to persist"
        )
    }

    func testMoreThanMinimalSizePersists() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3, 4, 5, 6
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            equal(
                [1, 2, 3, 4, 5, 6]
            ),
            description: "More than minimal size collection is expected to persist"
        )
    }

}
