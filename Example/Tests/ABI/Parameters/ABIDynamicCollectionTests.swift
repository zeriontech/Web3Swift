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

final class ABIDynamicCollectionTests: XCTestCase {

    func testDynamicCollectionEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIDynamicCollection(
                    parameters: [
                        ABIString(
                            origin: SimpleString(
                                string: "1"
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "2"
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "3"
                            )
                        )
                    ]
                ).heads(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array<UInt8>(repeating: 0x00, count: 31) + [0x20]
                )
            ),
            description: "ABI dynamic collection is expected to encode length to tails correctly"
        )
    }

    func testDynamicCollectionEncodesTailsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIDynamicCollection(
                    parameters: [
                        ABIBoolean(origin: true),
                        ABIBoolean(origin: false),
                        ABIBoolean(origin: true)
                    ]
                ).tails(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000001"
                )
            ),
            description: "ABI dynamic collection is expect to encode tails correctly"
        )
    }

}