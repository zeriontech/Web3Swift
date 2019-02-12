//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CollectionSingleTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class CollectionSingleTests: XCTestCase {

    func testCorrectSingleCollections() {
        expect{
            try "d".single()
        }.toNot(
            throwError(),
            description: "Single of a collection is not expected to throw error when 1 element is present"
        )
    }

    func testBigSingleCollections() {
        expect{
            try "da".single()
        }.to(
            throwError(errorType: IncorrectNumberOfElementsError.self),
            description: "Single of a collection is expected to throw when more than 1 element is present"
        )
    }

    func testEmptySingleCollections() {
        expect{
            try "".single()
        }.to(
            throwError(errorType: IncorrectNumberOfElementsError.self),
            description: "Single of a collection is expected to throw when more than 0 element is present"
        )
    }

}
