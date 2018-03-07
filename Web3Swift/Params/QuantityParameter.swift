import Foundation

public final class QuantityParameter: EthParameter {

    private let number: NumberScalar
    public init(number: NumberScalar) {
        self.number = number
    }

    /**
    Converts an ethereum `Quantity` to `String` dropping leading zeroes

    - returns:
    `Any` which should be a `String`
    */
    public func value() throws -> Any {
        let number = self.number
        return try "0x" + UnprefixedHexString(
            bytes: LeadingCompactBytes(
                origin: number.hex()
            )
        ).value().drop(while: { $0 == "0" })
    }

}
