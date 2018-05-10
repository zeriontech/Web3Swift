//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SizeBufferedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SizeBufferedBytesTests: XCTestCase {

    func testUnderflowIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "ff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xff]
                ]
            ),
            description: "A collection of a smaller size is expected to have a single element"
        )
    }

    func testExactSizeIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "aaff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xaa, 0xff]
                ]
            ),
            description: "A collection of a exact size is expected to have a single element"
        )
    }

    func testOverflowIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "aabbff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xaa, 0xbb],
                    [0xff]
                ]
            ),
            description: "A collection of a larger size is expected to be buffered correctly"
        )
    }

}
