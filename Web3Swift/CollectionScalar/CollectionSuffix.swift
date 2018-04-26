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

//Suffix (last n elements) of a collection
public final class CollectionSuffix<T>: CollectionScalar<T> {

    private let origin: CollectionScalar<T>
    private let from: NumberScalar

    /**
    Ctor

    - parameters:
        - origin: origin to suffix of minimum size `from` + 1
        - from: index to suffix from
    */
    public init(
        origin: CollectionScalar<T>,
        from: NumberScalar
    ) {
        self.origin = origin
        self.from = from
    }

    /**
    - returns:
    All elements after and including the specified index

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        let from = try self.from.uint()
        return try Array(
            SizeConstrainedCollection(
                origin: origin,
                minimum: from + 1
            ).value()
                .suffix(
                    from: Int(
                        from
                    )
                )
        )
    }

}