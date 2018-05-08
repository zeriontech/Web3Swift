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

//Anonymous boolean scalar wrapper
public final class SimpleBoolean: BooleanScalar {

    private let bool: () throws -> (Bool)

    /**
    Ctor

    - parameters:
        - bool: a closure that represents of a bool
    */
    public init(bool: @escaping () throws -> (Bool)) {
        self.bool = bool
    }

    /**
    Ctor

    - parameters:
        - bool: just a boolean value
    */
    public convenience init(bool: Bool) {
        self.init(bool: { bool })
    }

    /**
    - returns:
    `Bool` representation of a scalar

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Bool {
        return try bool()
    }

}
