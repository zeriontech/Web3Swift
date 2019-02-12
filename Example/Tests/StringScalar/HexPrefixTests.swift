//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// HexPrefixTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class HexPrefixTests: XCTestCase {

    func testCorrectValue() {
        expect{
            try HexPrefix().value()
        }.to(
            equal("0x"),
            description: "Hex prefix is expected to be 0x"
        )
    }

}
