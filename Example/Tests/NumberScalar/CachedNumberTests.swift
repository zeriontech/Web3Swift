//
// Created by Timofey on 3/15/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

//Some number that is random
fileprivate final class MutableRandomNumber: NumberScalar {

    private let origin: NumberScalar = BigEndianNumber(
        bytes: SimpleBytes{
            try RandomNonce(
                size: UInt(
                    MemoryLayout<UInt>.size
                )
            ).toData()
        }
    )

    /**
    - returns:
    random 32 bytes

    - throws:
    `Swift.Error` if something went wrong
    */
    fileprivate func hex() throws -> BytesScalar {
        return try origin.hex()
    }

    /**
    Will most probably throw if UInt isn't UInt256

    - returns:
    unsigned integer representation of the number

    - throws:
    `DescribedError` if something went wrong
    */
    fileprivate func uint() throws -> UInt {
        return try origin.uint()
    }

}

//swiftlint:disable force_try
//swiftlint:disable single_test_class
final class MutableRandomNumberTests: XCTestCase {

    func testMutableBytesAreMutable() {
        let number = MutableRandomNumber()
        expect{
            try number.uint()
        }.toNot(
            equal(try! number.uint()),
            description: "Random number is expected to be different every time"
        )
    }

}

final class CachedNumberTests: XCTestCase {

    func testCachedBytesAreImmutable() {
        let number = CachedNumber(
            origin: MutableRandomNumber()
        )
        expect{
            try number.uint()
        }.to(
            equal(try! number.uint()),
            description: "Cached number is expected to persist"
        )
    }

}