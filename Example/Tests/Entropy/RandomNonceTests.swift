//
// Created by Timofey on 1/31/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import CryptoSwift
import Nimble
import Quick
import secp256k1_ios
@testable import Web3Swift
import XCTest

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
        expect{
            let nonce = RandomNonce(size: 32)
            return try expect(
                nonce.toData()
            ).to(
                equal(
                    nonce.toData()
                )
            )
        }.toNot(
            throwError()
        )
    }

    func testNonceSize() {
        expect{
            try expect(
                [
                    RandomNonce(size: 32).toData().count,
                    RandomNonce(size: 20).toData().count,
                    RandomNonce(size: 1).toData().count
                ]
            ).to(
                equal(
                    [
                        32,
                        20,
                        1
                    ]
                )
            )
        }.toNot(
            throwError()
        )
    }
    
    func testRandomNonces() {
        expect{
            try expect(
                RandomNonce(size: 64).toData()
            ).toNot(
                equal(
                    RandomNonce(size: 64).toData()
                )
            )
        }.toNot(
            throwError()
        )
    }

}
