//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ElementAtTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class ElementAtTests: XCTestCase {

    func testCorrectElementIsFetched() {
        expect{
            try ElementAt<Int>(
                collection: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4
                    ]
                ),
                index: 3
            ).value()
        }.to(
            equal(3),
            description: "Element at an index is expected to fetch the same element as a standard array subscript"
        )
    }

    func testUnderflowThrows() {
        expect{
            try ElementAt<Int>(
                collection: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4
                    ]
                ),
                index: 5
            ).value()
        }.to(
            throwError(errorType: IndexOtOfBoundsError.self),
            description: "Element at an out of bounds index is expected to throw"
        )
    }

}
