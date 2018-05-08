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

//First n or less bytes of a bytes sequence
final public class FirstBytes: BytesScalar {

    private let origin: BytesScalar
    private let length: NumberScalar

    /**
    Ctor

    - parameters:
        - origin: bytes to take prefix of
        - length: maximum length of the prefix
    */
    public init(
        origin: BytesScalar,
        length: NumberScalar
    ) {
        self.origin = origin
        self.length = length
    }

    /**
    Ctor

    - parameters:
        - origin: bytes to take prefix of
        - length: maximum length of the prefix
    */
    public convenience init(
        origin: BytesScalar,
        length: UInt
    ) {
        self.init(
            origin: origin,
            length: BigEndianNumber(
                uint: length
            )
        )
    }

    /**
    - returns:
    Bytes represented as `Data` of size length or less

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try origin
            .value()
            .prefix(
                Int(
                    try length.uint()
                )
            )
    }

}
