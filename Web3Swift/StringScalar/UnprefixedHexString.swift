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

    convenience init(bytes: BytesScalar) {
        self.init(
            hex: SimpleString{
                return try String(
                    bytes.value().toHexString()
                )
            }
        )
    }

    func value() throws -> String {
        return try hex.value()
    }

}