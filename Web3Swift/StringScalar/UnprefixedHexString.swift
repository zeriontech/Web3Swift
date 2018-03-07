//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class UnprefixedHexString: StringScalar {

    private let hex: StringScalar
    init(hex: StringScalar) {
        self.hex = TrimmedPrefixString(
            string: HexString(hex: hex),
            prefix: SimpleString{ "0x" }
        )
    }

    func value() throws -> String {
        return try hex.value()
    }

}