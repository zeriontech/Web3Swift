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

//A collection of ABI parameters encoded as an ABI parameter
final class ABIDynamicCollection: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - parameters: ABI parameters to be encoded as a dynamic collection
    */
    init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    /**
    - parameters:
        - offset: number of elements preceding the dynamic collection tails

    - returns:
    A collection with a single element representing a distance from the beginning of the encoding to the tails of the dynamic collection
    */
    func heads(offset: Int) throws -> [BytesScalar] {
        return [
            LeftZeroPaddedBytes(
                origin: SimpleBytes{
                    try BigEndianNumber(
                        uint: UInt(offset) * 32
                    ).hex().value()
                },
                padding: 32
            )
        ]
    }

    /**
    - parameters:
        - offset: number of elements preceding the dynamic collection tails

    - returns:
    A collection of the parameters encodings prefixed by the parameters count. Parameters encodings are offset by the previous offset plus a 1 for the count prefix.
    */
    func tails(offset: Int) throws -> [BytesScalar] {
        let parameters = self.parameters
        return try [
            LeftZeroPaddedBytes(
                origin: SimpleBytes{
                    try BigEndianNumber(
                        uint: UInt(parameters.count)
                    ).hex().value()
                },
                padding: 32
            )
        ] + ABITuple(
            parameters: parameters
        ).heads(
            offset: offset + 1
        )
    }

}
