//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ByteWidthTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class ByteWidthTests: XCTestCase {

    func test0() {
        expect(
            0.unsignedByteWidth()
        ).to(
            equal(
                1
            )
        )
    }

    func test255() {
        expect(
            255.unsignedByteWidth()
        ).to(
            equal(
                1
            )
        )
    }

    func test256() {
        expect(
            256.unsignedByteWidth()
        ).to(
            equal(
                2
            )
        )
    }

    func test1024() {
        expect(
            1024.unsignedByteWidth()
        ).to(
            equal(
                2
            )
        )
    }

    func test4096() {
        expect(
            4096.unsignedByteWidth()
        ).to(
            equal(
                2
            )
        )
    }

    func test65535() {
        expect(
            65535.unsignedByteWidth()
        ).to(
            equal(
                2
            )
        )
    }

    func test65536() {
        expect(
            65536.unsignedByteWidth()
        ).to(
            equal(
                3
            )
        )
    }

    func testMaxInt() {
        expect(
            Int.max.unsignedByteWidth()
        ).to(
            equal(
                8
            )
        )
    }

}
