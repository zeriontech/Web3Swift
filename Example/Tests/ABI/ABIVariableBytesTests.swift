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

final class ABIVariableBytesTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIVariableBytes(
                    origin: BytesFromHexString(
                        hex: "4d00000000000000000000000000000000000000000000000000000000000012" +
                            "11"
                    )
                ).heads(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000020"
                )
            ),
            description: "ABI variable bytes are expected to encode length to tails correctly"
        )
    }

    func testEncodesTailsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIVariableBytes(
                    origin: BytesFromHexString(
                        hex: "4d00000000000000000000000000000000000000000000000000000000000012" +
                            "11"
                    )
                ).tails(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000021" +
                        "4d00000000000000000000000000000000000000000000000000000000000012" +
                        "1100000000000000000000000000000000000000000000000000000000000000"
                )
            ),
            description: "ABI variable bytes are expected to encode length to tails correctly"
        )
    }

}