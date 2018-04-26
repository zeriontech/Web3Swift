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

//Bytes without trailing zeroes
public final class TrailingCompactBytes: BytesScalar {

    private let compactOrigin: BytesScalar
    /**
    Ctor

    - parameters:
        - origin: bytes to be compacted
    */
    init(origin: BytesScalar) {
        self.compactOrigin = ReversedBytes(
            origin: LeadingCompactBytes(
                origin: ReversedBytes(
                    origin: origin
                )
            )
        )
    }

    /**
    - returns:
    bytes as `Data` without trailing zeroes (first value in case it is zero is not considered trailing)

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try compactOrigin.value()
    }

}