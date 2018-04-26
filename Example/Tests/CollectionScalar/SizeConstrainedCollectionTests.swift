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

final class SizeConstrainedCollectionTests: XCTestCase {

    func testUnderflowThrows() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            throwError(errorType: IndexOtOfBoundsError.self),
            description: "Underflow is expected to error out"
        )
    }

    func testMinimalSizePersists() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3, 4
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            equal(
                [1, 2, 3, 4]
            ),
            description: "Minimal size collection is expected to persist"
        )
    }

    func testMoreThanMinimalSizePersists() {
        expect{
            try SizeConstrainedCollection(
                origin: SimpleCollection(
                    collection: [
                        1, 2, 3, 4, 5, 6
                    ]
                ),
                minimum: 4
            ).value()
        }.to(
            equal(
                [1, 2, 3, 4, 5, 6]
            ),
            description: "More than minimal size collection is expected to persist"
        )
    }

}