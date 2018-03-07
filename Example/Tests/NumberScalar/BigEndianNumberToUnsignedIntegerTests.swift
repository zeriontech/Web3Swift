//
// Created by Timofey on 3/7/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class BigEndianNumberToUnsignedIntegerTests: XCTestCase {

    func test1() {
        expect{
            try BigEndianNumber(
                bytes: SimpleBytes(
                    bytes: [
                        0x01
                    ]
                )
            ).uint()
        }.to(
            equal(
                1
            )
        )
    }

    func test1023() {
        expect{
            try BigEndianNumber(
                bytes: SimpleBytes(
                    bytes: [
                        0x03,
                        0xff
                    ]
                )
            ).uint()
        }.to(
            equal(
                1023
            )
        )
    }

    func testMaxInt() {
        expect{
            try BigEndianNumber(
                uint: UInt.max
            ).uint()
        }.to(
            equal(UInt.max)
        )
    }

}