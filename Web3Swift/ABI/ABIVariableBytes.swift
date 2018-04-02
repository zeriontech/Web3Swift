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

public final class ABIVariableBytes: ABIEncodedParameter {

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
        - offset: number of elements preceding the variable bytes tails

    - returns:
    A collection with a single element representing a distance from the beginning of the encoding to the tails of the variable bytes
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        return [
            LeftZeroesPaddedBytes(
                origin: SimpleBytes{
                    try BigEndianNumber(
                        uint: UInt(offset) * 32
                    ).hex().value()
                },
                padding: 32
            )
        ]
    }

    //TODO: This implementation is not lazy and is difficult to understand
    /**
    - parameters:
        - offset: invariant for tails

    - returns:
    A collection with bytes count followed by the bytes
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        let value = try origin.value()
        return try [
            LeftZeroesPaddedBytes(
                origin: BigEndianNumber(
                    uint: UInt(
                        value.count
                    )
                ).hex(),
                padding: 32
            )
        ] + Array(value.enumerated())
            .splitAt{ index, _ in
                (index + 1) % 32 == 0
            }
            .map{ splitBytes in
                splitBytes.map{ _, bytes in
                    bytes
                }
            }
            .map{ bytes in
                RightZeroesPaddedBytes(
                    origin: SimpleBytes(
                        bytes: bytes
                    ),
                    padding: 32
                )
            }
    }

}
