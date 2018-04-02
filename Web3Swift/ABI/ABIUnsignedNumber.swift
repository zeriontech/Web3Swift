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

//Unsigned number encoded as an ABI parameter
public final class ABIUnsignedNumber: ABIEncodedParameter {

    private let origin: ABIEncodedParameter

    /**
    Ctor

    - parameters:
        - origin: number to encode
    */
    init(origin: NumberScalar) {
        self.origin = ABIFixedBytes(
            origin: LeftZeroPaddedBytes(
                origin: SimpleBytes{
                    try origin.hex().value()
                },
                padding: 32
            )
        )
    }

    /**
    - parameters:
        - offset: unsigned number is invariant

    - returns:
    A collection with a single element representing an ABI encoded number.
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        return try origin.heads(offset: offset)
    }

    /**
    - parameters:
        - offset: unsigned number is invariant

    - returns:
    Empty collection
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        return try origin.tails(offset: offset)
    }

}