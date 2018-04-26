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

//Bytes at a collection of bytes
public final class BytesAt: BytesScalar {

    private let element: ElementAt<BytesScalar>

    /**
    Ctor

    - parameters:
        - collection: a collection of bytes scalars
        - index: index of the bytes scalar
    */
    public init(
        collection: CollectionScalar<BytesScalar>,
        index: NumberScalar
    ) {
        self.element = ElementAt(
            collection: collection,
            index: index
        )
    }

    /**
    Ctor

    - parameters:
        - collection: a collection of bytes scalars
        - index: index of the bytes scalar
    */
    public convenience init(
        collection: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.init(
            collection: collection,
            index: BigEndianNumber(
                uint: index
            )
        )
    }

    /**
    - returns:
    Bytes at the specified index.

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try element.value().value()
    }

}