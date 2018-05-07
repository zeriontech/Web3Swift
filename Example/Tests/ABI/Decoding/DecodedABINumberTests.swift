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

final class DecodedABINumberTests: XCTestCase {

    func testPlainNumberIsDecodedCorrectly() {
        expect{
            try DecodedABINumber(
                abiMessage: ABIMessage(
                    message: "000000000000000000000000000000000000000000000000000000000000002a"
                ),
                index: 0
            ).uint()
        }.to(
            equal(
                42
            ),
            description: "ABI number is expected to persist"
        )
    }

    func testNumberAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABINumber(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "000000000000000000000000000000000000000000000000000000000000002a",
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
            ).uint()
        }.to(
            equal(
                42
            ),
            description: "ABI number at second position is expected to persist"
        )
    }

}