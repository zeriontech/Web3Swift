//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class BigEndianNumberHexTests: XCTestCase {

    //swiftlint:disable operator_usage_whitespace
    func testHexConversionFromBytes() {
        Array<Array<UInt8>>(
            [
                [0x01],
                [0x03, 0xff],
                [0xff, 0xff, 0xff, 0xff]
            ]
        ).forEach{ bytes in
            expect{
                try BigEndianNumber(
                    bytes: SimpleBytes(
                        bytes: bytes
                    )
                ).hex().value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Hex of a number from bytes is expected to persist"
            )
        }
    }

    //TODO: This is not an exact test because set neglects order. We need to test for ending overlap
    func testHexConversionFromUInt() {
        Array<(Array<UInt8>, UInt)>(
            [
                ([0x01], 1),
                ([0x03, 0xff], 1023),
                ([0xff, 0xff, 0xff, 0xff], 4294967295)
            ]
        ).forEach{ bytes, uint in
            expect{
                try Set<UInt8>(
                    BigEndianNumber(
                        uint: uint
                    ).hex().value()
                ).isSuperset(of: Set<UInt8>(bytes))
            }.to(
                equal(true),
                description: "Hex of a number from uint is expected to persist"
            )
        }
    }

    func testHexConversionFromString() {
        Array<(String, Array<UInt8>)>(
            [
                ("0x01", [0x01]),
                ("0x03ff", [0x03, 0xff]),
                ("0xffffffff", [0xff, 0xff, 0xff, 0xff])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BigEndianNumber(
                    hex: SimpleString(
                        string: hex
                    )
                ).hex().value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Hex of a number from hex string is expected to persist"
            )
        }
    }

}