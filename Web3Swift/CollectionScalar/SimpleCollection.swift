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

//Anonymous collection scalar wrapper
public final class SimpleCollection<T>: CollectionScalar<T> {

    private let collection: () throws -> (AnyCollection<T>)

    /**
    Ctor

    - parameters:
        - collection: a closure representing a type erased collection of elements
    */
    public init(collection: @escaping () throws -> (AnyCollection<T>)) {
        self.collection = collection
    }

    /**
    Ctor

    - parameters:
        - collection: a closure representing an array as a collection of elements
    */
    public convenience init(collection: @escaping () throws -> ([T])) {
        self.init(collection: { try AnyCollection(collection()) })
    }

    /**
    Ctor

    - parameters:
        - collection: an array of elements
    */
    public convenience init(collection: [T]) {
        self.init(collection: { collection })
    }

    /**
    - returns:
    An `Array` representation of collection of elements

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        return try Array(
            collection()
        )
    }

}