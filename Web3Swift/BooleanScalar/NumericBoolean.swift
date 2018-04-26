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

internal final class NotANumericBooleanError: DescribedError {

    private let number: UInt
    init(number: UInt) {
        self.number = number
    }

    var description: String {
        return "Numeric value \(number) does not represent a boolean. 0 or 1 was expected."
    }

}

//Boolean from a numeric value of 0 or 1
public final class NumericBoolean: BooleanScalar {

    private let bool: NumberScalar

    /**
    Ctor

    - parameters:
        - bool: boolean value represented as a number
    */
    public init(bool: NumberScalar) {
        self.bool = bool
    }

    /**
    - returns:
    true if numeric representation is 1, false if numeric representation is 0

    - throws:
    `DescribedError` if something went wrong. I.e. number was not 1 or 0.
    */
    public func value() throws -> Bool {
        let value = try bool.uint()
        if value == 0 {
            return false
        } else if value == 1 {
            return true
        } else {
            throw NotANumericBooleanError(
                number: value
            )
        }
    }

}