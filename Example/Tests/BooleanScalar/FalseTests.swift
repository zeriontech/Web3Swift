//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FalseTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class FalseTests: XCTestCase {

    func testFalsePersists() {
        expect{
            try False().value()
        }.to(
            equal(
                false
            ),
            description: "False is expected to always be false"
        )
    }

}
