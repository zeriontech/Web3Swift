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

//Generated collection
public final class GeneratedCollection<T>: CollectionScalar<T> {

    private let element: (_ index: UInt) throws -> (T)
    private let times: UInt

    /**
    Ctor

    - parameters:
        - element: indexed element factory called up to `times` times
        - times: number of times to call the factory
    */
    public init(
        element: @escaping (_ index: UInt) throws -> (T),
        times: UInt
    ) {
        self.element = element
        self.times = times
    }

    /**
    - returns:
    A collection of generated element of size `times`

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        return try (0..<times).map{ index in
            try element(index)
        }
    }

}