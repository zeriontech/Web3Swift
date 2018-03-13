//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class BigEndianCompactNumberTests: XCTestCase {

    func testResolvesAmbiguity() {
        Array<
            (
                String,
                Array<UInt8>
            )
        >(
            [
                ("0x0", [0x00]),
                ("0x1", [0x01]),
                ("0x3ff", [0x03, 0xff]),
                ("0xD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e", [0x0d, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])
            ]
        ).forEach{ hex, bytes in
            expect{
                try BigEndianCompactNumber(
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
                description: "Ambiguous prefixed hex string is expected to produce valid number by appending a leading zero"
            )
        }
    }

}