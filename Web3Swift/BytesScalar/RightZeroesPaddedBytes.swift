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

//Pads bytes with zeroes to the right
public final class RightZeroesPaddedBytes: BytesScalar {

    private let origin: BytesScalar
    private let padding: UInt

    /**
    Ctor

    - parameters:
        - origin: bytes to pad
        - padding: size to which to pad to
    */
    public init(
        origin: BytesScalar,
        padding: UInt
    ) {
        self.origin = origin
        self.padding = padding
    }

    /**
    - returns:
    Bytes as `Data` padded with zeroes to the right

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let origin = try self.origin.value()
        let padding = Int(self.padding)
        return try ConcatenatedBytes(
            bytes: [
                SimpleBytes(
                    bytes: origin
                ),
                SimpleBytes(
                    bytes: Data(
                        repeating: 0x00,
                        count: (padding - (origin.count % padding)) % padding
                    )
                )
            ]
        ).value()
    }

}
