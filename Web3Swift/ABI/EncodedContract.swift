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

//Encoded initialized contract bytes
public final class EncodedContract: BytesScalar {

    private let byteCode: BytesScalar
    private let arguments: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - bytesCode: bytes code of the contract
        - arguments: arguments of the contract ctor
    */
    public init(
        byteCode: BytesScalar,
        arguments: [ABIEncodedParameter]
    ) {
        self.byteCode = byteCode
        self.arguments = arguments
    }

    /**
    - returns:
    Bytes representation of the initialized contract
    */
    public func value() throws -> Data {
        return try ConcatenatedBytes(
            bytes: [
                byteCode,
                EncodedABITuple(
                    parameters: arguments
                )
            ]
        ).value()
    }

}
