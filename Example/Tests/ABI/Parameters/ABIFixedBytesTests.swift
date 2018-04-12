/**
Copyright 2018 Timofey Solonin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import Nimble
import Quick
@testable import Web3Swift

final class ABIFixedBytesTests: XCTestCase {

    func testEncodedBytesCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIFixedBytes(
                    origin: SimpleBytes(
                        bytes: [
                            0x01, 0x02
                        ]
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0x01, 0x02] + Array<UInt8>(repeating: 0x00, count: 30)
                )
            ),
            description: "Encoded fixed bytes are expected to be padded to the length of 32 with zeroes to the right"
        )
    }

    func testThrowsOnOverflow() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIFixedBytes(
                    origin: SimpleBytes(
                        bytes: Array<UInt8>(repeating: 0x00, count: 33)
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            throwError(errorType: IncorrectBytesLengthError.self),
            description: "Encoded fixed bytes are expected to throw on overflow"
        )
    }

    func testTailsAreEmpty() {
        expect{
            try ABIFixedBytes(
                origin: SimpleBytes(
                    bytes: [
                        0x01, 0x02
                    ]
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "Tails are expected to be empty"
        )
    }

}