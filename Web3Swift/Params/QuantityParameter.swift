import Foundation

public final class QuantityParameter: EthParameter {

    private let number: NumberScalar

    /**
    Ctor

    - parameters:
        - number: number to be converted to parameter
    */
    public init(number: NumberScalar) {
        self.number = number
    }

    /**
    - returns:
    `String` representation of the number as specified by ethereum JSON RPC (dropping any leading zeroes in string representation)

    - throws:
    `DescribedError` is something went wrong
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
