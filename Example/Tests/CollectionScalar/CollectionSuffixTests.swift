//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CollectionSuffixTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class CollectionSuffixTests: XCTestCase {

    func testCollectionSuffixIsCorrect() {
        expect{
            try CollectionSuffix(
                origin: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4, 5
                    ]
                ),
                from: SimpleInteger(
                    integer: 4
                )
            ).value()
        }.to(
            equal(
                [4, 5]
            ),
            description: "Suffix is expected to be the content of the collection from the specified index to the end"
        )
    }

    func testUnderflowThrows() {
        expect{
            try CollectionSuffix(
                origin: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4, 5
                    ]
                ),
                from: SimpleInteger(
                    integer: 6
                )
            ).value()
        }.to(
            throwError(errorType: IndexOtOfBoundsError.self),
            description: "Suffix from an incorrect index is expected to throw"
        )
    }

}
