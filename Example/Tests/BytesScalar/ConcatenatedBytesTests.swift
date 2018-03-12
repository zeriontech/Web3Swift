//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class ConcatenatedBytesTests: XCTestCase {

    //swiftlint:disable operator_usage_whitespace
    func testCorrectlyConcatenatedBytes() {
        Array<(Array<BytesScalar>, Array<UInt8>)>(
            [
                (
                    [BytesScalar](),
                    [UInt8]()
                ),
                (
                    [
                        SimpleBytes(bytes: [0x01, 0x02]),
                        SimpleBytes(bytes: [0x03]),
                        SimpleBytes(bytes: [0x04])
                    ],
                    [
                        0x01,
                        0x02,
                        0x03,
                        0x04
                    ]
                )
            ]
        ).forEach{ scalars, bytes in
            expect{
                try ConcatenatedBytes(
                    bytes: scalars
                ).value()
            }.to(
                equal(
                    Data(bytes: bytes)
                ),
                description: "Concatenated bytes are expected to match their Data representation"
            )
        }
    }

}