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

final class ABIBooleanTests: XCTestCase {

    func testTrueHeads() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIBoolean(
                    origin: true
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array<UInt8>(repeating: 0x00, count: 31) + [0x01]
                )
            ),
            description: "True is expected to be equal to ABI encoding of 1"
        )
    }

    func testFalseHeads() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIBoolean(
                    origin: false
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array<UInt8>(repeating: 0x00, count: 32)
                )
            ),
            description: "True is expected to be equal to ABI encoding of 0"
        )
    }

    func testEmptyTail() {
        Array<ABIEncodedParameter>(
            [
                ABIBoolean(
                    origin: true
                ),
                ABIBoolean(
                    origin: false
                )
            ]
        ).forEach{ parameter in
            expect{
                try parameter.tails(offset: 0)
            }.to(
                beEmpty(),
                description: "Boolean tails is expected to be empty"
            )
        }
    }

}