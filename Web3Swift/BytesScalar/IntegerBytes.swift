//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class IntegerBytes: BytesScalar {

    private let uint: UInt
    init(uint: UInt) {
        self.uint = uint
    }

    public func value() throws -> Data {
        var integerCopy = uint
        return Data(
            bytes: &integerCopy,
            count: MemoryLayout.size(ofValue: integerCopy)
        )
    }

}