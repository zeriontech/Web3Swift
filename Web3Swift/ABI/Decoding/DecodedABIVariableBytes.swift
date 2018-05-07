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

//Decoded bytes of variable length
public final class DecodedABIVariableBytes: BytesScalar {

    private let abiMessage: CollectionScalar<BytesScalar>
    private let index: UInt

    /**
    Ctor

    - parameters:
        - abiMessage: message where bytes are located
        - index: position of the bytes
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.abiMessage = abiMessage
        self.index = index
    }

    /**
    - returns:
    Decoded variable bytes

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let abiTuple = self.abiMessage
        let offsetsCount = try BigEndianNumber(
            bytes: BytesAt(
                collection: abiTuple,
                index: index
            )
        ).uint() / 32
        let bytesLength = try BigEndianNumber(
            bytes: BytesAt(
                collection: abiTuple,
                index: offsetsCount
            )
        ).uint()
        return try FirstBytes(
            origin: ConcatenatedBytes(
                bytes: GeneratedCollection<BytesScalar>(
                    element: { index in
                        BytesAt(
                            collection: abiTuple,
                            index: index + offsetsCount + 1
                        )
                    },
                    times: ((bytesLength + 31) / 32)
                )
            ),
            length: bytesLength
        ).value()
    }

}