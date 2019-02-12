//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ReversedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ReversedBytesTests: XCTestCase {

    func testBytesAreCorrectlyReversed() {
        expect{
            try ReversedBytes(
                origin: SimpleBytes(
                    bytes: [
                        1, 2, 3, 4
                    ]
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        4, 3, 2, 1
                    ]
                )
            ),
            description: "Bytes are expected to be correctly reversed"
        )
    }

}
