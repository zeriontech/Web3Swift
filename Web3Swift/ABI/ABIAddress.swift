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

final class ABIAddress: ABIEncodedParameter {

    private let address: ABIEncodedParameter
    init(address: BytesScalar) {
        self.address = ABIFixedBytes(
            origin: FixedLengthBytes(
                origin: LeftZeroPaddedBytes(
                    origin: address,
                    padding: 32
                ),
                length: 32
            )
        )
    }

    func heads(offset: Int) throws -> [BytesScalar] {
        return try address.heads(offset: offset)
    }

    func tails(offset: Int) throws -> [BytesScalar] {
        return try address.tails(offset: offset)
    }

}