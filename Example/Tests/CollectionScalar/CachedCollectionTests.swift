//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CachedCollectionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class MutableCollectionOfBytes: CollectionScalar<BytesScalar> {

    /**
    - returns:
    random 32 bytes as `Data`
    */
    override func value() throws -> [BytesScalar] {
        return try GeneratedCollection<BytesScalar>(
            element: { _ in
                try SimpleBytes(
                    bytes: RandomNonce(size: 1).toData()
                )
            },
            times: EthNaturalNumber(
                bytes: SimpleBytes(
                    bytes: RandomNonce(size: 1).toData()
                )
            ).value()
        ).value()
    }

}

//swiftlint:disable force_try
//swiftlint:disable single_test_class
final class MutableRandomCollectionOfBytesTests: XCTestCase {

    func testMutableCollectionIsMutable() {
        let collection = MutableCollectionOfBytes()
        expect{
            try collection.value().map{ try $0.value() }
        }.toNot(
            equal(try! collection.value().map{ try $0.value() }),
            description: "Random collection of bytes is expected to be different every time"
        )
    }

}

final class CachedCollectionTests: XCTestCase {

    func testCachedCollectionIsImmutable() {
        let collection = CachedCollection(
            origin: MutableCollectionOfBytes()
        )
        expect{
            try collection.value().map{ try $0.value() }
        }.to(
            equal(try! collection.value().map{ try $0.value() }),
            description: "Cached collection is expected to persist"
        )
    }

}
