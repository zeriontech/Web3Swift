//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class LeadingCompactBytesTests: XCTestCase {

    //swiftlint:disable operator_usage_whitespace
    func testPersistsCompactBytes() {
        Array<(BytesScalar, Array<UInt8>)>(
            [
                (
                    SimpleBytes(bytes: [0x00]),
                    Array<UInt8>([0x00])
                ),
                (
                    SimpleBytes(bytes: [0x01, 0x00, 0x01, 0x00]),
                    Array<UInt8>([0x01, 0x00, 0x01, 0x00])
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try LeadingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    Data(bytes: bytes)
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

    func testCorrectlyCompactedBytes() {
        Array<(BytesScalar, Array<UInt8>)>(
            [
                (
                    SimpleBytes(bytes: [0x00, 0x00, 0x00]),
                    Array<UInt8>([0x00])
                ),
                (
                    SimpleBytes(bytes: [0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00]),
                    Array<UInt8>([0x01, 0x00, 0x01, 0x00])
                )
            ]
        ).forEach{ scalar, bytes in
            expect{
                try LeadingCompactBytes(
                    origin: scalar
                ).value()
            }.to(
                equal(
                    Data(bytes: bytes)
                ),
                description: "Already compact bytes are expected to persist"
            )
        }
    }

}