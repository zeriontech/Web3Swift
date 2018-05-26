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

internal final class IndexOutOfBoundsError: DescribedError {

    private let collectionSize: UInt
    private let index: UInt

    init(
        collectionSize: UInt,
        index: UInt
    ) {
        self.collectionSize = collectionSize
        self.index = index
    }

    internal var description: String {
        return "Index \(index) is out of bounds in a collection of size \(collectionSize)"
    }

}

//Collection constrained in its size
public final class SizeConstrainedCollection<T>: CollectionScalar<T> {

    private let origin: CollectionScalar<T>
    private let minimum: NumberScalar

    /**
    Ctor

    - parameters:
        - origin: origin to constraint in size
        - minimum: minimum number of elements expected in the collection
    */
    public init(
        origin: CollectionScalar<T>,
        minimum: NumberScalar
    ) {
        self.origin = origin
        self.minimum = minimum
    }

    /**
    Ctor

    - parameters:
        - origin: origin to constraint in size
        - minimum: minimum number of elements expected in the collection
    */
    public convenience init(
        origin: CollectionScalar<T>,
        minimum: UInt
    ) {
        self.init(
            origin: origin,
            minimum: BigEndianNumber(
                uint: minimum
            )
        )
    }

    /**
    - returns:
    A collection with a size of at least `minimum`

    - throws:
    `DescribedError` if something went wrong. I.e. if size of the collection was less than `minimum`.
    */
    public override func value() throws -> [T] {
        let origin = try self.origin.value()
        let minimum = try self.minimum.uint()
        guard origin.count >= Int(minimum) else {
            throw IndexOutOfBoundsError(
                collectionSize: UInt(origin.count),
                index: minimum
            )
        }
        return origin
    }

}