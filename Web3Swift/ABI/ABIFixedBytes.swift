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

//Fixed length bytes (up to 32) encoded as an ABI parameter
public final class ABIFixedBytes: ABIEncodedParameter {

    private let origin: BytesScalar

    /**
    Ctor

    - parameters:
        - origin: bytes to be encoded
    */
    init(origin: BytesScalar) {
        self.origin = origin
    }

    /**
    - parameters:
        - offset: fixed bytes are invariant

    - returns:
    A collection with a single element representing an ABI encoded boolean value.
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        return [
            FixedLengthBytes(
                origin: RightZeroPaddedBytes(
                    origin: origin,
                    padding: 32
                ),
                length: 32
            )
        ]
    }

    /**
    - parameters:
        - offset: fixed bytes are invariant

    - returns:
    Empty collection
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        return []
    }

}