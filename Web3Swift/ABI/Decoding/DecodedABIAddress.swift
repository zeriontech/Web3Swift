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

//Ethereum address decoded from an abi message
public final class DecodedABIAddress: BytesScalar {

    private let origin: BytesScalar

    /**
    Ctor

    - parameters:
        - abiMessage: message where address is located
        - index: position of the address
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.origin = EthAddress(
            bytes: NumberHex(
                number: DecodedABINumber(
                    abiMessage: abiMessage,
                    index: index
                )
            )
        )
    }

    /**
    - returns:
    Address decoded from the message

    - throws:
    `DescribedError` if something 
    */
    public func value() throws -> Data {
        return try origin.value()
    }

}