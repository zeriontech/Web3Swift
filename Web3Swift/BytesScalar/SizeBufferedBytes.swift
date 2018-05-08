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

//Bytes buffered into collection elements by a size predicate
public final class SizeBufferedBytes: CollectionScalar<BytesScalar> {

    private let origin: BytesScalar
    private let size: NumberScalar

    /**
    Ctor

    - parameters:
        - origin: origin to buffer
        - size: maximum size of each element
    */
    public init(
        origin: BytesScalar,
        size: NumberScalar
    ) {
        self.origin = origin
        self.size = size
    }

    /**
    Ctor

    - parameters:
        - origin: origin to buffer
        - size: maximum size of each element
    */
    public convenience init(
        origin: BytesScalar,
        size: UInt
    ) {
        self.init(
            origin: origin,
            size: BigEndianNumber(
                uint: size
            )
        )
    }

    /**
    - returns:
    A collection of bytes sequences buffered up to the specified `size`

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [BytesScalar] {
        return try Array(self.origin.value().enumerated())
            .splitAt{ index, _ in
                try (index + 1) % Int(size.uint()) == 0
            }
            .map{ enumeratedOrigin in
                SimpleBytes(
                    bytes: enumeratedOrigin.map{ _, origin in
                        origin
                    }
                )
            }
    }

}
