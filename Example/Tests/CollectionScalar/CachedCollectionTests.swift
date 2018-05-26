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

final class MutableCollectionOfBytes: CollectionScalar<BytesScalar> {

    /**
    - returns:
    random 32 bytes as `Data`
    */
    override func value() throws -> [BytesScalar] {
        return try GeneratedCollection<BytesScalar>(
            element: { _ in
                try SimpleBytes(
                    bytes: RandomNonce(size: 1).toData()
                )
            },
            times: BigEndianNumber(
                bytes: SimpleBytes(
                    bytes: RandomNonce(size: 1).toData()
                )
            ).uint()
        ).value()
    }

}

//swiftlint:disable force_try
//swiftlint:disable single_test_class
final class MutableRandomCollectionOfBytesTests: XCTestCase {

    func testMutableCollectionIsMutable() {
        let collection = MutableCollectionOfBytes()
        expect{
            try collection.value().map{ try $0.value() }
        }.toNot(
            equal(try! collection.value().map{ try $0.value() }),
            description: "Random collection of bytes is expected to be different every time"
        )
    }

}

final class CachedCollectionTests: XCTestCase {

    func testCachedCollectionIsImmutable() {
        let collection = CachedCollection(
            origin: MutableCollectionOfBytes()
        )
        expect{
            try collection.value().map{ try $0.value() }
        }.to(
            equal(try! collection.value().map{ try $0.value() }),
            description: "Cached collection is expected to persist"
        )
    }

}