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

final class SimpleCollectionTests: XCTestCase {

    func testClosureToTypeErasedCollectionPersists() {
        expect{
            try SimpleCollection<Int>{
                AnyCollection(
                    [1, 2, 3]
                )
            }.value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from a closure of type erased collection is expected to persist"
        )
    }

    func testClosureToArrayPersists() {
        expect{
            try SimpleCollection<Int>{
                [1, 2, 3]
            }.value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from a closure of array is expected to persist"
        )
    }

    func testDirectArrayPersists() {
        expect{
            try SimpleCollection<Int>(
                collection: [1, 2, 3]
            ).value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from an array is expected to persist"
        )
    }

    func testDirectTypeErasedCollectionPersists() {
        expect{
            try SimpleCollection<Int>(
                collection: AnyRandomAccessCollection(
                    [1, 2, 3]
                )
            ).value()
        }.to(
            equal(
                [1, 2, 3]
            ),
            description: "Collection from any collection with a matching type is expected to persist"
        )
    }

}