//
// Created by Timofey on 3/7/18.
//

import Foundation

//Bytes without leading zeroes
public final class LeadingCompactBytes: BytesScalar {

    private let origin: BytesScalar
    /**
    Ctor

    - parameters:
        - origin: bytes to be compacted
    */
    init(origin: BytesScalar) {
        self.origin = origin
    }

    /**
    - returns:
    bytes as `Data` without leading zeroes (last value in case it is zero is not considered leading)

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let bytes = try origin.value()
        return bytes.dropLast().drop(while: { $0 == 0 }) + [bytes.last].flatMap{ $0 }
    }

}