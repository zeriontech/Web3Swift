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

final class ASCIIStringBytesTests: XCTestCase {

    func testGivesCorrectASCIIRepresentation() {
        expect{
            try ASCIIStringBytes(
                string: SimpleString(
                    string: "hello"
                )
            ).value()
        }.to(
            equal(
                Data(
                    hex: "68656c6c6f"
                )
            ),
            description: "ascii representation is expected to persist"
        )
    }

    func testNonASCIICharacterThrows() {
        expect{
            try ASCIIStringBytes(
                string: SimpleString(
                    string: "∆"
                )
            ).value()
        }.to(
            throwError(errorType: NotAnASCIIScalarError.self),
            description: "Non ascii characters are expected to cause an error"
        )
    }

}