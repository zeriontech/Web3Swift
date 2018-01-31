//
// Created by Timofey on 1/31/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Web3Swift

final class RandomNonceTests: XCTestCase {

    func testNotEmptyData() {
        expect(
            try RandomNonce(size: 32).toData()
        ).toNot(
            beEmpty()
        )
    }

    func testNotZeroBytes() {
        expect(
            try RandomNonce(size: 32).toData()
        ).toNot(
            equal(
                Data(
                    bytes: Array<UInt8>(repeating: 0, count: 32)
                )
            )
        )
    }

    func testNoThrowing() {
        expect(
            try RandomNonce(size: 32).toData()
        ).toNot(
            throwError()
        )
    }

    func testImmutability() {
        let nonce = RandomNonce(size: 32)
        let firstNonceData = try! nonce.toData()
        let secondNonceData = try! nonce.toData()
        expect(
            firstNonceData
        ).to(
            equal(
                secondNonceData
            )
        )
    }

}
