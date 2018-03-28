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

final class RightZeroPaddedBytesTests: XCTestCase {

    func testBytesArePaddedNumericallyCorrectly() {
        Array<
            (
                Data, Data
            )
        >(
            [
                (
                    Data(repeating: 0x00, count: 0),
                    Data(repeating: 0x00, count: 0)
                ),
                (
                    Data(repeating: 0x00, count: 1),
                    Data(repeating: 0x00, count: 32)
                ),
                (
                    Data(repeating: 0x00, count: 32),
                    Data(repeating: 0x00, count: 32)
                ),
                (
                    Data(repeating: 0x00, count: 33),
                    Data(repeating: 0x00, count: 64)
                )
            ]
        ).forEach{ initialBytes, paddedBytes in
            expect{
                try RightZeroPaddedBytes(
                    origin: SimpleBytes(
                        bytes: initialBytes
                    ),
                    padding: 32
                ).value()
            }.to(
                equal(paddedBytes)
            )
        }
    }

    func testPaddingPersistsOrigin() {
        Array<String>(
            [
                "Hello",
                String(repeating: "i", count: 32),
                String(repeating: "i", count: 33)
            ]
        ).forEach{ prefix in
            expect{
                try String(
                    bytes: RightZeroPaddedBytes(
                        origin: UTF8StringBytes(string: prefix),
                        padding: 32
                    ).value(),
                    encoding: .utf8
                )
            }.to(
                beginWith(prefix)
            )
        }
    }

}