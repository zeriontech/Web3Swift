//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABIDynamicCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

//swiftlint:disable function_body_length

final class DecodedABIDynamicCollectionTests: XCTestCase {

    func testPlainCollectionOfAddressesIsDecodedCorrectly() {
        expect{
            try DecodedABIDynamicCollection<BytesScalar>(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000020",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8070",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8071",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8072",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8073",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8074"
                    ].reduce("", +)
                ),
                mapping: { slice, index in
                    DecodedABIAddress(
                        abiMessage: slice,
                        index: index
                    )
                },
                index: 0
            ).value().map{
                try $0.value().toHexString()
            }
        }.to(
            equal(
                [
                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8070",
                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8071",
                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8072",
                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8073",
                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8074"
                ]
            ),
            description: "A dynamic collection of addresses is expected to persists"
        )
    }

    func testTwoDimensionalCollectionOfAddressesAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABIDynamicCollection<
                CollectionScalar<
                    BytesScalar
                >
            >(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000001",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8070",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8071",
                        "0000000000000000000000000000000000000000000000000000000000000003",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8072",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8073",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b8074"
                    ].reduce("", +)
                ),
                mapping: { slice, index in
                    DecodedABIDynamicCollection(
                        abiMessage: slice,
                        mapping: { slice, index in
                            DecodedABIAddress(
                                abiMessage: slice,
                                index: index
                            )
                        },
                        index: index
                    )
                },
                index: 1
            ).value().map{
                try $0.value().map{
                    try $0.value().toHexString()
                }
            }
        }.to(
            equal(
                [
                    [
                        "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8070",
                        "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8071"
                    ],
                    [
                        "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8072",
                        "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8073",
                        "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8074"
                    ]
                ]
            ),
            description: "Two dimensional dynamic collection of addresses at second position is expected to persist"
        )
    }

    func testTwoDimensionalCollectionOfStringsAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABIDynamicCollection<CollectionScalar<StringScalar>>(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000001",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000003",
                        "0000000000000000000000000000000000000000000000000000000000000060",
                        "00000000000000000000000000000000000000000000000000000000000001a0",
                        "0000000000000000000000000000000000000000000000000000000000000220",
                        "0000000000000000000000000000000000000000000000000000000000000003",
                        "0000000000000000000000000000000000000000000000000000000000000060",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "00000000000000000000000000000000000000000000000000000000000000e0",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "68656c6c6f000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "776f726c64000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000003",
                        "6f6e650000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000001",
                        "0000000000000000000000000000000000000000000000000000000000000020",
                        "0000000000000000000000000000000000000000000000000000000000000003",
                        "74776f0000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000080",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "7468726565000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000004",
                        "666f757200000000000000000000000000000000000000000000000000000000",
                    ].reduce("", +)
                ),
                mapping: { slice, index in
                    DecodedABIDynamicCollection(
                        abiMessage: slice,
                        mapping: { slice, index in
                            DecodedABIString(
                                abiMessage: slice,
                                index: index
                            )
                        },
                        index: index
                    )
                },
                index: 1
            ).value().map{
                try $0.value().map{
                    try $0.value()
                }
            }
        }.to(
            equal(
                [
                    [
                        "hello",
                        "world",
                        "one"
                    ],
                    [
                        "two"
                    ],
                    [
                        "three",
                        "four"
                    ]
                ]
            ),
            description: "Two dimensional dynamic collection of strings at second position is expected to persist"
        )
    }

}
