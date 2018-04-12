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

//String value encoded as an ABI parameter
public final class ABIString: ABIEncodedParameter {

    private let origin: ABIEncodedParameter

    /**
    Ctor

    - parameters:
        - origin: string to be encoded
    */
    public init(origin: StringScalar) {
        self.origin = ABIVariableBytes(
            origin: UTF8StringBytes(
                string: origin
            )
        )
    }

    /**
    - parameters:
        - offset: number of elements preceding the string tails

    - returns:
    A collection with a single element representing a distance from the beginning of the encoding to the tails of the string
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        return try origin.heads(offset: offset)
    }

    /**
    - parameters:
        - offset: invariant for tails

    - returns:
    A collection of encoded bytes from utf8 representation of a string prefixed by the length of the string in utf8 representation
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        return try origin.tails(offset: offset)
    }

}