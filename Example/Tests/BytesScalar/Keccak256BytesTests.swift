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

final class Keccak256BytesTests: XCTestCase {

    func testDigestsCorrectly() {
        expect{
            try Keccak256Bytes(
                origin: ASCIIStringBytes(
                    string: SimpleString(
                        string: "baz(uint32,bool)"
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0992ec5bbfc459984220f8c45084cc24d9b6efed1fae540db8de801d2"
                )
            ),
            description: "Keccak256 is expected to digest correctly"
        )
    }

}