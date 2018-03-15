//
// Created by Timofey on 3/15/18.
//

import Foundation

//Permanently cached bytes
public final class CachedBytes: BytesScalar {

    private let stickyValue: StickyComputation<Data>

    /**
    - parameters:
        - origin: bytes to cache
    */
    public init(origin: BytesScalar) {
        self.stickyValue = StickyComputation{
            try origin.value()
        }
    }

    /**
    - returns:
    Bytes as `Data` of the cached origin

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try stickyValue.result()
    }

}