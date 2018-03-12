//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation

//Bytes from their string representation. The string representation of bytes must not be ambiguous.
public final class BytesFromHexString: BytesScalar {

    private let hex: StringScalar

    /**
    Ctor

    - parameters:
        - hex: `StringScalar` representing bytes in hex format
    */
    init(hex: StringScalar) {
        self.hex = HexString(hex: hex)
    }

    /**
    Ctor

    - parameters:
        - hex: `String` representing bytes in hex format
    */
    convenience init(hex: String) {
        self.init(hex: SimpleString{ hex })
    }

    /**
    - returns:
    Bytes interpretation of the content of the string

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try Data(
            hex: hex.value()
        )
    }

}