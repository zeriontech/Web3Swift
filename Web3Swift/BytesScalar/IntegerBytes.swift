//
// Created by Timofey on 3/7/18.
//

import Foundation

//Bytes representation of an integer
public final class IntegerBytes: BytesScalar {

    private let uint: UInt
    /**
    Ctor

    - parameters:
        - uint: an integer for which to get bytes. Endiannes should be specified in advanced.
    */
    init(uint: UInt) {
        self.uint = uint
    }

    /**
    - returns:
    bytes as `Data` of the integer value.

    - throws:
    doesn't throw
    */
    public func value() throws -> Data {
        var integerCopy = uint
        return Data(
            bytes: &integerCopy,
            count: MemoryLayout.size(ofValue: integerCopy)
        )
    }

}