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

//Address encoded as an ABI parameter
final class ABIAddress: ABIEncodedParameter {

    private let address: ABIEncodedParameter

    //TODO: Should EthAddress defensive decorator be here?
    /**
    Ctor

    - parameters:
        - address: ethereum address represented as bytes
    */
    init(address: BytesScalar) {
        self.address = ABIFixedBytes(
            origin: FixedLengthBytes(
                origin: LeftZeroPaddedBytes(
                    origin: EthAddress(
                        bytes: address
                    ),
                    padding: 32
                ),
                length: 32
            )
        )
    }

    /**
    - parameters:
        - offset: address is invariant

    - returns:
    A collection with a single element representing an ABI encoded ethereum address.

    - throws:
    `DescribedError` if something went wrong
    */
    func heads(offset: Int) throws -> [BytesScalar] {
        return try address.heads(offset: offset)
    }

    /**
    - parameters:
        - offset: address is invariant

    - returns:
    Empty collection.

    - throws:
    `DescribedError` if something went wrong
    */
    func tails(offset: Int) throws -> [BytesScalar] {
        return try address.tails(offset: offset)
    }

}