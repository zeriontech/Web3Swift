//
// Created by Timofey on 3/13/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class EthRLPTests: XCTestCase {

    func testEncodesZeroCorrectly() {
        expect{
            try EthRLP(
                number: BigEndianCompactNumber(
                    origin: BigEndianNumber(
                        uint: 0
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0x80]
                )
            ),
            description: "EthRLP encoded 0 is expected to match empty byte RLP encoding (0x80)"
        )
    }

    func testEncodingPersistsForOtherValues() {
        Array<
            (
                UInt,
                Array<UInt8>
            )
        >(
            [
                (1, [0x01]),
                (15, [0x0f]),
                (1024, [0x82, 0x04, 0x00])
            ]
        ).forEach{ value, bytes in
            expect{
                try EthRLP(
                    number: BigEndianCompactNumber(
                        origin: BigEndianNumber(
                            uint: value
                        )
                    )
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: bytes
                    )
                ),
                description: "Value \(value) is expected to be encoded as \(bytes)"
            )
        }
    }

}