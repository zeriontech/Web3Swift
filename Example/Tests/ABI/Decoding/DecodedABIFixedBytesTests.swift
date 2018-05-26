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

final class DecodedABIFixedBytesTests: XCTestCase {

    func testPlainFixBytesAreDecodedCorrectly() {
        expect{
            try DecodedABIFixedBytes(
                abiMessage: ABIMessage(
                    message: "0001020300000000000000000000000000000000000000000000000000000000"
                ),
                length: 4,
                index: 0
            ).value().toHexString()
        }.to(
            equal(
                "00010203"
            ),
            description: "ABI fixed bytes are expected to persist"
        )
    }

    func testFixedBytesAtSecondPositionAreDecodedCorrectly() {
        expect{
            try DecodedABIFixedBytes(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0001020300000000000000000000000000000000000000000000000000000000",
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
                length: 4,
                index: 1
            ).value().toHexString()
        }.to(
            equal(
                "00010203"
            ),
            description: "ABI fixed bytes at second position are expected to persist"
        )
    }

}