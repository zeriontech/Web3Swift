//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BytesAsCollectionTests.swift
//
// Created by Timofey Solonin on 23/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class BytesAsCollectionTests: XCTestCase {

    func testBytesArePersisted() {
        let bytes: [UInt8] = [0x01, 0x02, 0x03, 0x42]
        expect{
            try BytesAsCollection(
                origin: SimpleBytes(
                    bytes: bytes
                )
            ).value()
        }.to(
            equal(
                bytes
            ),
            description: "Bytes are expected to persist"
        )
    }

}