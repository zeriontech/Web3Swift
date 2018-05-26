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

final class SizeBufferedBytesTests: XCTestCase {

    func testUnderflowIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "ff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xff]
                ]
            ),
            description: "A collection of a smaller size is expected to have a single element"
        )
    }

    func testExactSizeIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "aaff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xaa, 0xff]
                ]
            ),
            description: "A collection of a exact size is expected to have a single element"
        )
    }

    func testOverflowIsBufferedCorrectly() {
        expect{
            try MappedCollection(
                origin: SizeBufferedBytes(
                    origin: BytesFromHexString(
                        hex: "aabbff"
                    ),
                    size: 2
                ),
                mapping: {
                    try Array($0.value())
                }
            ).value()
        }.to(
            equal(
                [
                    [0xaa, 0xbb],
                    [0xff]
                ]
            ),
            description: "A collection of a larger size is expected to be buffered correctly"
        )
    }

}