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

import CryptoSwift
import Foundation

//Encoded ABI function call
final class EncodedABIFunction: BytesScalar {

    private let signature: StringScalar
    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - signature: function title followed by parameters titles
        - parameters: parameters of the function
    */
    public init(signature: StringScalar, parameters: [ABIEncodedParameter]) {
        self.signature = signature
        self.parameters = parameters
    }

    /**
    - returns:
    Encoded function as `Data`

    - throws:
    `DescribedError` if something went wrong.
    */
    func value() throws -> Data {
        return try ConcatenatedBytes(
            bytes: [
                Keccak256Bytes(
                    origin: ASCIIStringBytes(
                        string: signature
                    )
                )
            ] + ABITuple(
                parameters: parameters
            ).heads(offset: 0)
        ).value()
    }

}