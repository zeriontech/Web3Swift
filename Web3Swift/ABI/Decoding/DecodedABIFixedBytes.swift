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

//Decoded bytes with fixed length (up to 32)
public final class DecodedABIFixedBytes: BytesScalar {

    private let bytes: BytesScalar

    /**
    Ctor

    - parameters:
        - abiMessage: message where bytes are located
        - length: expected number of bytes
        - index: position of the bytes
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        length: UInt,
        index: UInt
    ) {
        self.bytes = FirstBytes(
            origin: BytesAt(
                collection: abiMessage,
                index: index
            ),
            length: length
        )
    }

    /**
    - returns:
    Decoded bytes

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try bytes.value()
    }

}