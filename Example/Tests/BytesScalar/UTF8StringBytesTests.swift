//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UTF8StringBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class UTF8StringBytesTests: XCTestCase {

    func testCorrectUTF8Bytes() {
        expect{
            try UTF8StringBytes(
                string: "Hello world"
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array("Hello world".utf8)
                )
            )
        )
    }

}
