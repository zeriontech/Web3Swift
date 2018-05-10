//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EnumeratedCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EnumeratedCollectionTests: XCTestCase {

    func testElementsAreEnumeratedCorrectly() {
        let indexes: [Int] = [0, 1, 2, 3, 4, 5]
        expect{
            try EnumeratedCollection(
                origin: SimpleCollection(
                    collection: indexes
                )
            ).value().map{ index, _ in
                index
            }
        }.to(
            equal(
                indexes
            ),
            description: "A collection is expected to be enumerated correctly"
        )
    }

}
