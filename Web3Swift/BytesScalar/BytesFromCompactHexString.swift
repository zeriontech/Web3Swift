//
// Created by Timofey on 3/12/18.
//

import Foundation

//Bytes from a compact hex string (without any leading zeroes)
public final class BytesFromCompactHexString: BytesScalar {

    private let hex: StringScalar

    /**
    Ctor

    - parameters:
        - hex: hex string representation of the bytes. A leading zero is added if string representation is a valid hex of odd length.
    */
    public init(hex: StringScalar) {
        self.hex = hex
    }

    /**
    - returns:
    bytes as `Data` represented by the compact hex string

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try BytesFromHexString(
            hex: SimpleString{
                let hex = try TrimmedPrefixString(
                    string: self.hex,
                    prefix: HexPrefix()
                ).value()
                if hex.count.isEven() {
                    return hex
                } else {
                    return "0" + hex
                }
            }
        ).value()
    }

}
