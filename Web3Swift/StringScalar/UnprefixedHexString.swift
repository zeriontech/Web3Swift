//
// Created by Timofey on 3/7/18.
//

import Foundation

//Hex string that is not prefixed by "0x"
public final class UnprefixedHexString: StringScalar {

    private let hex: StringScalar

    /**
    Ctor

    - parameters:
        - hex: a string describing a hexadecimal
    */
    public init(hex: StringScalar) {
        self.hex = TrimmedPrefixString(
            string: HexString(hex: hex),
            prefix: HexPrefix()
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
    Unprefixed `String` representation of a hexadecimal

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        return try hex.value()
    }

}
