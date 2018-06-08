//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CachedNumberTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

//Some number that is random
fileprivate final class MutableRandomInteger: IntegerScalar {

    private let origin: IntegerScalar = EthInteger(
        hex: SimpleBytes{
            try RandomNonce(
                size: MemoryLayout<Int>.size - 1
            ).toData()
        }
    )

    /**
    - returns:
    random 32 bytes

    - throws:
    `Swift.Error` if something went wrong
    */
    fileprivate func value() throws -> Int {
        return try origin.value()
    }

}

//swiftlint:disable force_try
//swiftlint:disable single_test_class
final class MutableRandomNumberTests: XCTestCase {

    func testMutableBytesAreMutable() {
        let number = MutableRandomInteger()
        expect{
            try number.value()
        }.toNot(
            equal(try! number.value()),
            description: "Random number is expected to be different every time"
        )
    }

}

final class CachedNumberTests: XCTestCase {

    func testCachedBytesAreImmutable() {
        let number = CachedInteger(
            origin: MutableRandomInteger()
        )
        expect{
            try number.value()
        }.to(
            equal(try! number.value()),
            description: "Cached number is expected to persist"
        )
    }

}
