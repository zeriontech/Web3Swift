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

//A collection of elements mapped from `C` to `T`
public final class MappedCollection<C, T>: CollectionScalar<T> {

    private let origin: CollectionScalar<C>
    private let mapping: (C) throws -> (T)

    /**
    Ctor

    - parameters:
        - origin: origin to map
        - mapping: closure for transforming `C` into `T`
    */
    public init(
        origin: CollectionScalar<C>,
        mapping: @escaping (C) throws -> (T)
    ) {
        self.origin = origin
        self.mapping = mapping
    }

    /**
    - returns:
    A collection of `T` as `Array`

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        return try origin.value().map{ c in
            try mapping(c)
        }
    }

}