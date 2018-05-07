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

//Boolean decoded from an abi message
public final class DecodedABIBoolean: BooleanScalar {

    private let origin: BooleanScalar

    /**
    Ctor

    - parameters:
        - abiMessage: message where boolean is located
        - index: position of the boolean
    */
    init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.origin = NumericBoolean(
            bool: DecodedABINumber(
                abiMessage: abiMessage,
                index: index
            )
        )
    }

    /**
    - returns:
    Boolean decoded from the message

    - throws:
    `DescribedError` if something went wrong. I.e. if value at the specified index did not represent a boolean
    */
    public func value() throws -> Bool {
        return try origin.value()
    }

}