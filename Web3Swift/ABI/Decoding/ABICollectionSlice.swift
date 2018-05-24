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

import Foundation

//A slice of an non typed abi dynamic collection
public final class ABICollectionSlice: CollectionScalar<BytesScalar> {

    private let abiMessage: CollectionScalar<BytesScalar>
    private let index: UInt

    /**
    Ctor

    - parameters:
        - abiMessage: message containing the collection
        - index: position of the collection
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.abiMessage = abiMessage
        self.index = index
    }

    /**
        Right now collection slice grabs everything after the length of the
        dynamic collection which means that it grabs every parameter encoded
        into a message after itself. This is irrelevant when decoding but may
        be a problem in the future.
    */
    /**
    - returns:
    Non typed content of the collection.

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [BytesScalar] {
        return try CollectionSuffix(
            origin: abiMessage,
            from: BigEndianNumber(
                uint: BigEndianNumber(
                    bytes: BytesAt(
                        collection: abiMessage,
                        index: index
                    )
                ).uint() / 32 + 1
            )
        ).value()
    }

}