//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GeneratedCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class GeneratedCollectionTests: XCTestCase {

    func testCorrectElementsAreEnumeratedAndGenerated() {
        expect{
            try GeneratedCollection(
                element: { index in
                    return index
                },
                times: 5
            ).value()
        }.to(
            equal(
                [0, 1, 2, 3, 4]
            ),
            description: "Generated collection is expected to be called specified number of times with incremental indexes"
        )
    }

}
