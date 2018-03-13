//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class FixedLengthBytesTests: XCTestCase {

    func testProperlyFixedLengthBytes() {
        Array<UInt>([0, 20]).forEach{ length in
            expect{
                try FixedLengthBytes(
                    origin: SimpleBytes(
                        bytes: Array(
                            repeating: 0x00,
                            count: Int(length)
                        )
                    ),
                    length: length
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: Array(
                            repeating: 0x00,
                            count: Int(length)
                        )
                    )
                ),
                description: "Fixed length bytes are expected to persist"
            )
        }
    }

    func testIncorrectLengthBytes() {
        Array<UInt>([0, 20]).forEach{ length in
            expect{
                try FixedLengthBytes(
                    origin: SimpleBytes(
                        bytes: Array(
                            repeating: 0x00,
                            count: Int(length)
                        )
                    ),
                    length: length + 1
                ).value()
            }.to(
                throwError(errorType: IncorrectBytesLengthError.self),
                description: "Fixed length bytes which appear to be of different length are expected to throw"
            )
        }
    }

}
