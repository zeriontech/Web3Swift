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

final class DecodedABIBooleanTests: XCTestCase {

    func testPlainBooleanIsDecodedCorrectly() {
        expect{
            try DecodedABIBoolean(
                abiMessage: ABIMessage(
                    message: "0000000000000000000000000000000000000000000000000000000000000001"
                ),
                index: 0
            ).value()
        }.to(
            equal(
                true
            ),
            description: "ABI boolean is expected to persist"
        )
    }

    func testBooleanAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABIBoolean(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000001",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "cc00000000000000000000000000000000000000000000000000000000000000",
                        "bb00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "aa00000000000000000000000000000000000000000000000000000000000000",
                        "ff00000000000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 1
            ).value()
        }.to(
            equal(
                true
            ),
            description: "ABI boolean at second position is expected to persist"
        )
    }

}