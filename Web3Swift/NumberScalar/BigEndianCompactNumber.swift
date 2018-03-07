//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class BigEndianCompactNumber: NumberScalar {

    private let origin: NumberScalar
    init(hex: StringScalar) {
        self.origin = BigEndianNumber(
            hex: SimpleString{
                let hex = try TrimmedPrefixString(
                    string: hex,
                    prefix: SimpleString{ "0x" }
                ).value()
                if hex.count.isEven() {
                    return hex
                } else {
                    return "0" + hex
                }
            }
        )
    }

    convenience init(hex: String) {
        self.init(hex: SimpleString{ hex })
    }

    public func hex() throws -> BytesScalar {
        return try LeadingCompactBytes(
            origin: origin.hex()
        )
    }

    public func uint() throws -> UInt {
        return try origin.uint()
    }

}