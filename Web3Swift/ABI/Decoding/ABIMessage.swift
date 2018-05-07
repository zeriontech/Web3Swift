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

//abi message represented as a collection of 32 bytes sequences
public final class ABIMessage: CollectionScalar<BytesScalar> {

    private let message: CollectionScalar<BytesScalar>

    /**
    Ctor

    - parameters:
        - message: concatenated bytes of the abi message
    */
    init(message: BytesScalar) {
        self.message = SizeConstrainedCollection(
            origin: MappedCollection(
                origin: SizeBufferedBytes(
                    origin: message,
                    size: 32
                ),
                mapping: {
                    FixedLengthBytes(
                        origin: $0,
                        length: 32
                    )
                }
            ),
            minimum: 1
        )
    }

    /**
    Ctor

    - parameters:
        - message: concatenated string representation of bytes of the abi message
    */
    convenience init(message: StringScalar) {
        self.init(
            message: BytesFromHexString(
                hex: message
            )
        )
    }

    /**
    Ctor

    - parameters:
        - message: concatenated string representation of bytes of the abi message
    */
    convenience init(message: String) {
        self.init(
            message: SimpleString(
                string: message
            )
        )
    }

    /**
    - returns:
    A collection of sequences of bytes of length 32

    - throws:
    `DescribedError` if something went wrong. I.e. if collection was empty
    */
    public override func value() throws -> [BytesScalar] {
        return try message.value()
    }

}