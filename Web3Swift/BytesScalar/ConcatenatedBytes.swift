//
// Created by Timofey on 3/7/18.
//

import Foundation

//Bytes concatenated into a single collection
public final class ConcatenatedBytes: BytesScalar {

    private let bytes: [BytesScalar]

    /**
    Ctor

    - parameters
        - bytes: a collection of bytes to be concatenated
    */
    init(bytes: [BytesScalar]) {
        self.bytes = bytes
    }

    /**
    - returns:
    bytes as `Data` of the bytes collection with respect to their position in the collection

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try bytes.reduce(Data()) {
            try $0 + $1.value()
        }
    }

}