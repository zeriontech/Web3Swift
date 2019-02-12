//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SizeOfTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SizeOfTests: XCTestCase {

    func testSizeIsTakenCorrectly() {
        expect{
            try SizeOf(
                collection: SimpleCollection(
                    collection: Array<Int>(
                        repeating: 0,
                        count: 6
                    )
                )
            ).value()
        }.to(
            equal(
                6
            ),
            description: "Number of elements in the collection is expected to be counted correctly"
        )
    }

}