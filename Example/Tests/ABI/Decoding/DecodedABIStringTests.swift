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

final class DecodedABIStringTests: XCTestCase {

    func testPlainStringIsDecodedCorrectly() {
        expect{
            try DecodedABIString(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000020",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "68656c6c6f000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 0
            ).value()
        }.to(
            equal(
                "hello"
            ),
            description: "ABI string is expected to persist"
        )
    }

    func testStringAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABIString(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "0000000000000000000000000000000000000000000000000000000000000160",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "cc00000000000000000000000000000000000000000000000000000000000000",
                        "bb00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "aa00000000000000000000000000000000000000000000000000000000000000",
                        "ff00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000005",
                        "68656c6c6f000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 1
            ).value()
        }.to(
            equal(
                "hello"
            ),
            description: "ABI string at second position is expected to persist"
        )
    }

    func test33CharactersStringIsDecodedCorrectly() {
        expect{
            try DecodedABIString(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000020",
                        "0000000000000000000000000000000000000000000000000000000000000021",
                        "68656c6c6f68656c6c6f68656c6c6f68656c6c6f68656c6c6f68656c6c6f6865",
                        "6c00000000000000000000000000000000000000000000000000000000000000",
                    ].reduce("", +)
                ),
                index: 0
            ).value()
        }.to(
            equal(
                "hellohellohellohellohellohellohel"
            ),
            description: "Long ABI string is expected to persist"
        )
    }

}