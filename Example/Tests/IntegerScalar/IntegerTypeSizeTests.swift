//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegerTypeSizeTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegerTypeSizeTests: XCTestCase {

    func testIntegerTypeSizeIsItsWidthInBytes() {
        expect{
            try IntegerTypeSize().value()
        }.to(
            equal(
                MemoryLayout<Int>.size
            ),
            description: "Integer type size is Int type size in bytes"
        )
    }

}