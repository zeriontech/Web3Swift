//
// Created by Timofey on 1/27/18.
//

import Foundation

fileprivate class NotAnIntError: Swift.Error { }

extension Int {

    init(prefixedHexString: String) throws {
        if let int = Int(
            prefixedHexString.dropFirst(2),
            radix: 16
        ) {
            self = int
        } else {
            throw NotAnIntError()
        }
    }

    func unsignedByteWidth() -> Int {
        return (self.bitWidth - self.leadingZeroBitCount - 1).unsafeDivided(by: 8) + 1
    }

    /**
    Tells if Int is even (divisible by 2 with 0 as a remainder)

    - returns:
    true if even, false if odd
    */
    func isEven() -> Bool {
        return self % 2 == 0
    }

}