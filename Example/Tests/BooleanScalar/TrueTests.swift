//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TrueTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class TrueTests: XCTestCase {

    func testTruePersists() {
        expect{
            try True().value()
        }.to(
            equal(
                true
            ),
            description: "True is expected to always be true"
        )
    }

}
