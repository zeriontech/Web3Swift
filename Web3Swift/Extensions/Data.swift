//
// Created by Timofey on 1/28/18.
//

import Foundation

extension Data {

    init(integer: UInt) {
        var integerCopy = integer
        self = Data(
            bytes: &integerCopy,
            count: MemoryLayout.size(ofValue: integerCopy)
        )
    }

    func droppingLeadingZeroes() -> Data {
        return self.dropLast().drop(while: { $0 == 0 }) + [self.last].flatMap{$0}
    }

}