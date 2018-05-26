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

//Decoded number
public final class DecodedABINumber: NumberScalar {

    private let number: NumberScalar

    /**
    Ctor

    - parameters:
        - abiMessage: message where number is located
        - index: position of the number
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.number = BigEndianCompactNumber(
            origin: BigEndianNumber(
                bytes: BytesAt(
                    collection: abiMessage,
                    index: index
                )
            )
        )
    }

    /**
    - returns:
    UInt representation of a decoded number

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try number.uint()
    }

    /**
    - returns:
    Compact hex representation of a decoded number

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return try number.hex()
    }

}