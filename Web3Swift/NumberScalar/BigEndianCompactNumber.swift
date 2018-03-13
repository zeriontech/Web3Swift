//
// Created by Timofey on 3/7/18.
//

import Foundation

//A compact big endian number (without leading zeroes)
public final class BigEndianCompactNumber: NumberScalar {

    private let origin: NumberScalar

    /**
    Ctor

    - parameters:
        - origin: number for compact representation
    */
    init(origin: NumberScalar) {
        self.origin = origin
    }

    /**
    Ctor

    - parameters:
        - hex: compact string representation of the number. A leading zero is added if string representation is a valid hex of odd length.
    */
    convenience init(hex: StringScalar) {
        self.init(
            origin: BigEndianNumber(
                bytes: BytesFromCompactHexString(
                    hex: hex
                )
            )
        )
    }

    /**
    Ctor

    - parameters:
        - hex: compact string representation of the number. A leading zero is added if string representation is a valid hex of odd length.
    */
    convenience init(hex: String) {
        self.init(
            hex: SimpleString{ hex }
        )
    }

    /**
    - returns:
    bytes of the number in big endian order without leading zeroes.

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return try LeadingCompactBytes(
            origin: origin.hex()
        )
    }

    /**
    - returns:
    unsigned integer representation of the number

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try origin.uint()
    }

}