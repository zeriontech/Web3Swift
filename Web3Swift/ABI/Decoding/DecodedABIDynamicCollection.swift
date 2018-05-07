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

//Decoded typed abi collection
public final class DecodedABIDynamicCollection<T>: CollectionScalar<T> {

    private let abiMessage: CollectionScalar<BytesScalar>
    private let mapping: ((slice: CollectionScalar<BytesScalar>, index: UInt)) throws -> (T)
    private let index: UInt

    /**
    Ctor
    
    - parameters:
        - abiMessage: message where dynamic collection is located
        - mapping: transformation for elements of the collection
        - index: position of the collection
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        mapping: @escaping ((slice: CollectionScalar<BytesScalar>, index: UInt)) throws -> (T),
        index: UInt
    ) {
        self.abiMessage = abiMessage
        self.mapping = mapping
        self.index = index
    }

    /**
    - returns:
    A collection of elements specified by the `mapping`
    
    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        let mapping = self.mapping
        let elementsCount = try BigEndianNumber(
            bytes: BytesAt(
                collection: abiMessage,
                index: try BigEndianNumber(
                    bytes: BytesAt(
                        collection: abiMessage,
                        index: index
                    )
                ).uint() / 32
            )
        ).uint()
        let slice = ABICollectionSlice(
            abiMessage: abiMessage,
            index: index
        )
        return try GeneratedCollection(
            element: { index in
                try mapping(
                    (
                        slice: slice,
                        index: index
                    )
                )
            },
            times: elementsCount
        ).value()
    }

}