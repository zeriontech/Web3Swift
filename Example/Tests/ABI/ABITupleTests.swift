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

final class ABITupleTests: XCTestCase {

    func testEncodesHeadsCorrectly() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIBoolean(
                            origin: true
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "baz(uint32,bool)"
                            )
                        ),
                        ABIBoolean(
                            origin: true
                        )
                    ]
                ).heads(offset: 1)
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000010" +
                        "62617A2875696E7433322C626F6F6C2900000000000000000000000000000000"
                )
            ),
            description: "ABI tuple is expected to encode heads of parameters followed by their tails"
        )
    }

    func testTailsAreEmpty() {
        func testTailsAreEmpty() {
            expect{
                try ABITuple(
                    parameters: [
                        ABIBoolean(
                            origin: true
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "baz(uint32,bool)"
                            )
                        ),
                        ABIBoolean(
                            origin: true
                        )
                    ]
                ).tails(offset: 0)
            }.to(
                beEmpty(),
                description: "Tails are expected to be empty"
            )
        }
    }

}