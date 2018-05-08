//
// Created by Timofey on 1/27/18.
//

import Foundation

extension Int {

    internal func unsignedByteWidth() -> Int {
        return (self.bitWidth - self.leadingZeroBitCount - 1).unsafeDivided(by: 8) + 1
    }

    /**
    Tells if Int is even (divisible by 2 with 0 as a remainder)

    - returns:
    true if even, false if odd
    */
    internal func isEven() -> Bool {
        return self % 2 == 0
    }

}