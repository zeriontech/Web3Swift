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

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIUnsignedNumberTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIUnsignedNumber(
                    origin: BigEndianNumber(
                        bytes: BytesFromHexString(
                            hex: "12345678"
                        )
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000012345678"
                )
            ),
            description: "Encoded unsigned number is expected to be padded to the length of 32 with zeroes to the left"
        )
    }

    func testEncodesTailsCorrectly() {
        expect{
            try ABIUnsignedNumber(
                origin: BigEndianNumber(
                    bytes: BytesFromHexString(
                        hex: "12345678"
                    )
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "T"
        )
    }

}