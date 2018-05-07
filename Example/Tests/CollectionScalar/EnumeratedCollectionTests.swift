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

final class EnumeratedCollectionTests: XCTestCase {

    func testElementsAreEnumeratedCorrectly() {
        let indexes: [Int] = [0, 1, 2, 3, 4, 5]
        expect{
            try EnumeratedCollection(
                origin: SimpleCollection(
                    collection: indexes
                )
            ).value().map{ index, _ in
                index
            }
        }.to(
            equal(
                indexes
            ),
            description: "A collection is expected to be enumerated correctly"
        )
    }

}