//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SimpleCollectionTests: XCTestCase {

    func testClosureToTypeErasedCollectionPersists() {
        expect{
            try SimpleCollection<Int>{
                AnyCollection(
                    [1, 2, 3]
                )
            }.value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from a closure of type erased collection is expected to persist"
        )
    }

    func testClosureToArrayPersists() {
        expect{
            try SimpleCollection<Int>{
                [1, 2, 3]
            }.value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from a closure of array is expected to persist"
        )
    }

    func testDirectArrayPersists() {
        expect{
            try SimpleCollection<Int>(
                collection: [1, 2, 3]
            ).value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from an array is expected to persist"
        )
    }

}
