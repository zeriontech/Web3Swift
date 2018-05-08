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

//Hex of a Number
public class NumberHex: BytesScalar {

    private let number: NumberScalar

    /**
    Ctor

    - parameters:
        - number: number to take the hex from
    */
    public init(number: NumberScalar) {
        self.number = number
    }

    /**
    - returns:
    Hex of the number as `Data`
    */
    public func value() throws -> Data {
        return try number.hex().value()
    }

}
