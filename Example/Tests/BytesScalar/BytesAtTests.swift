//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BytesAtTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class BytesAtTests: XCTestCase {

    func testCorrectElementIsFetched() {
        expect{
            try BytesAt(
                collection: SimpleCollection(
                    collection: [
                        SimpleBytes(
                            bytes: [0, 1, 2]
                        ),
                        SimpleBytes(
                            bytes: [3, 4, 5]
                        ),
                        SimpleBytes(
                            bytes: [6, 7, 8]
                        )
                    ]
                ),
                index: 1
            ).value()
        }.to(
            equal(
                Data(
                    [
                        3, 4, 5
                    ]
                )
            ),
            description: "Bytes scalar at the specified index is expected to fetch"
        )
    }

    func testUnderflowThrows() {
        expect{
            try BytesAt(
                collection: SimpleCollection(
                    collection: [
                        SimpleBytes(
                            bytes: [0, 1, 2]
                        ),
                        SimpleBytes(
                            bytes: [3, 4, 5]
                        ),
                        SimpleBytes(
                            bytes: [6, 7, 8]
                        )
                    ]
                ),
                index: 3
            ).value()
        }.to(
            throwError(errorType: IndexOutOfBoundsError.self),
            description: "Underflow is expected to throw"
        )
    }

}
