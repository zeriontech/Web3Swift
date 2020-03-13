//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ConcatenatedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class ConcatenatedBytesTests: XCTestCase {

    func testCorrectlyConcatenatedBytes() {
        Array<
            (
                Array<BytesScalar>,
                Array<UInt8>
            )
        >(
            [
                (
                    [BytesScalar](),
                    [UInt8]()
                ),
                (
                    [
                        SimpleBytes(bytes: [0x01, 0x02]),
                        SimpleBytes(bytes: [0x03]),
                        SimpleBytes(bytes: [0x04])
                    ],
                    [
                        0x01,
                        0x02,
                        0x03,
                        0x04
                    ]
                )
            ]
        ).forEach{ scalars, bytes in
            expect{
                try ConcatenatedBytes(
                    bytes: scalars
                ).value()
            }.to(
                equal(
                    Data(bytes)
                ),
                description: "Concatenated bytes are expected to match their Data representation"
            )
        }
    }

    func testBytesFromACollectionScalarAreConcatenatedCorrectly() {
        Array<
            (
                CollectionScalar<BytesScalar>,
                Array<UInt8>
            )
        >(
            [
                (
                    SimpleCollection<BytesScalar>(
                        collection: []
                    ) as CollectionScalar<BytesScalar>,
                    [UInt8]()
                ),
                (
                    SimpleCollection<BytesScalar>(
                        collection: [
                            SimpleBytes(bytes: [0x01, 0x02]),
                            SimpleBytes(bytes: [0x03]),
                            SimpleBytes(bytes: [0x04])
                        ]
                    ) as CollectionScalar<BytesScalar>,
                    [
                        0x01,
                        0x02,
                        0x03,
                        0x04
                    ]
                )
            ]
        ).forEach{ scalars, bytes in
            expect{
                try ConcatenatedBytes(
                    bytes: scalars
                ).value()
            }.to(
                equal(
                    Data(bytes)
                ),
                description: "Concatenated bytes are expected to match their Data representation"
            )
        }
    }

}
