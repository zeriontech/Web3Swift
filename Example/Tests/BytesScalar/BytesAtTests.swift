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

final class BytesAtTests: XCTestCase {

    func testCorrectElementIsFetched() {
        expect{
            try BytesAt(
                collection: SimpleCollection(
                    collection: [
                        SimpleBytes(
                            bytes: [0, 1, 2]
                        ),
                        SimpleBytes(
                            bytes: [3, 4, 5]
                        ),
                        SimpleBytes(
                            bytes: [6, 7, 8]
                        )
                    ]
                ),
                index: 1
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        3, 4, 5
                    ]
                )
            ),
            description: "Bytes scalar at the specified index is expected to fetch"
        )
    }

    func testUnderflowThrows() {
        expect{
            try BytesAt(
                collection: SimpleCollection(
                    collection: [
                        SimpleBytes(
                            bytes: [0, 1, 2]
                        ),
                        SimpleBytes(
                            bytes: [3, 4, 5]
                        ),
                        SimpleBytes(
                            bytes: [6, 7, 8]
                        )
                    ]
                ),
                index: 3
            ).value()
        }.to(
            throwError(errorType: IndexOutOfBoundsError.self),
            description: "Underflow is expected to throw"
        )
    }

}