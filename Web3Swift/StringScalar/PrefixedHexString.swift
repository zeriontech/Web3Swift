//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation

//Hex string that is prefixed by "0x"
public final class PrefixedHexString: StringScalar {

    private let hex: StringScalar

    /**
    Ctor

    - parameters:
        - hex: a string describing a hexadecimal
    */
    public init(hex: StringScalar) {
        self.hex = HexPrefixedString(
            origin: HexString(
                hex: hex
            )
        )
    }

    /**
    Ctor

    - parameters:
        - bytes: bytes of a hexadecimal
    */
    public convenience init(bytes: BytesScalar) {
        self.init(
            hex: SimpleString{
                try bytes.value().toHexString()
            }
        )
    }

    /**
    - returns:
    Prefixed `String` representation of a hexadecimal

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        return try hex.value()
    }

}
