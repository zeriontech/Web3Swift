//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation

public final class BytesFromHexString: BytesScalar {

    private let hex: StringScalar
    init(hex: StringScalar) {
        self.hex = HexString(hex: hex)
    }

    convenience init(hex: String) {
        self.init(hex: SimpleString{ hex })
    }

    public func value() throws -> Data {
        return try Data(
            hex: hex.value()
        )
    }

}