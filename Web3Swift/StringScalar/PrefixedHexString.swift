//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation

public final class PrefixedHexString: StringScalar {

    private let hex: StringScalar
    init(hex: StringScalar) {
        self.hex = HexString(hex: hex)
    }

    convenience init(bytes: BytesScalar) {
        self.init(
            hex: SimpleString{
                return try bytes.value().toHexString()
            }
        )
    }

    func value() throws -> String {
        let hex = try self.hex.value()
        if hex.hasPrefix("0x") {
            return hex
        } else {
            return "0x" + hex
        }
    }

}