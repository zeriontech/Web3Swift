//
// Created by Timofey on 1/28/18.
//

import CryptoSwift
import Foundation

private final class AmbiguousHexStringError: DescribedError {

    private let hexValue: String
    init(hexValue: String) {
        self.hexValue = hexValue
    }

    var description: String {
        return "Hex string \(hexValue) length \(hexValue.count) is not even"
    }

}

extension Data {

    /**
    ctor

    - throws:
    If `hexValue` is ambiguous a `DescribedError` is thrown
    */
    init(hexValue: String) throws {
        guard hexValue.count.isEven() else { throw AmbiguousHexStringError(hexValue: hexValue) }
        self = Data(hex: hexValue)
    }

    init(integer: UInt) {
        var integerCopy = integer
        self = Data(
            bytes: &integerCopy,
            count: MemoryLayout.size(ofValue: integerCopy)
        )
    }

    internal func droppingLeadingZeroes() -> Data {
        return self.dropLast().drop(while: { $0 == 0 }) + [self.last].flatMap{ $0 }
    }

}
