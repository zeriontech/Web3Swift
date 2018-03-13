//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class IntegerBytesTests: XCTestCase {

    func testLittleEndianInteger() {
        expect{
            try IntegerBytes(
                uint: UInt(1).littleEndian
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0x01] + Array(repeating: 0x00, count: MemoryLayout<UInt>.size - 1)
                )
            ),
            description: "Integer bytes are expected to respect endianness"
        )
    }

    func testBigEndianInteger() {
        expect{
            try IntegerBytes(
                uint: UInt(1).bigEndian
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array(repeating: 0x00, count: MemoryLayout<UInt>.size - 1) + [0x01]
                )

            ),
            description: "Integer bytes are expected to respect endianness"
        )
    }

}