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

//Permanently cached collection
public final class CachedCollection<T>: CollectionScalar<T> {

    private let origin: StickyComputation<[T]>

    /**
    Ctor

    - parameters:
        - origin: origin to cache
    */
    public init(
        origin: CollectionScalar<T>
    ) {
        self.origin = StickyComputation{ try origin.value() }
    }

    /**
    - returns:
    Cached collection as `Array` of `T`

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        return try origin.result()
    }

}