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

final class ABIDynamicCollection: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]

    init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

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
        ).heads(offset: offset + 1)
    }

}
