//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CachedBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

//Some bytes that are random
fileprivate final class MutableRandomBytes: BytesScalar {

    /**
    - returns:
    random 32 bytes as `Data`

    - throws:
    `Swift.Error` if something went wrong
    */
    fileprivate func value() throws -> Data {
        return try RandomNonce(size: 32).toData()
    }

}

//swiftlint:disable force_try
//swiftlint:disable single_test_class
final class MutableRandomBytesTests: XCTestCase {

    func testMutableBytesAreMutable() {
        let bytes = MutableRandomBytes()
        expect{
            try bytes.value()
        }.toNot(
            equal(try! bytes.value()),
            description: "Random bytes are expected to be different every time"
        )
    }

}

final class CachedBytesTests: XCTestCase {

    func testCachedBytesAreImmutable() {
        let bytes = CachedBytes(
            origin: MutableRandomBytes()
        )
        expect{
            try bytes.value()
        }.to(
            equal(try! bytes.value()),
            description: "Cached bytes are expected to persist"
        )
    }

}
