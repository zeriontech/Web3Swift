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

final class CollectionSuffixTests: XCTestCase {

    func testCollectionSuffixIsCorrect() {
        expect{
            try CollectionSuffix(
                origin: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4, 5
                    ]
                ),
                from: BigEndianNumber(
                    uint: 4
                )
            ).value()
        }.to(
            equal(
                [4, 5]
            ),
            description: "Suffix is expected to be the content of the collection from the specified index to the end"
        )
    }

    func testUnderflowThrows() {
        expect{
            try CollectionSuffix(
                origin: SimpleCollection(
                    collection: [
                        0, 1, 2, 3, 4, 5
                    ]
                ),
                from: BigEndianNumber(
                    uint: 6
                )
            ).value()
        }.to(
            throwError(errorType: IndexOutOfBoundsError.self),
            description: "Suffix from an incorrect index is expected to throw"
        )
    }

}