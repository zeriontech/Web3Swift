import Foundation

public final class QuantityParameter: EthParameter {

    private let hex: Hex

    /**
    ctor that accepts a `Hex`
    */
    public init(hex: Hex) {
        self.hex = hex
    }

//    /**
//    ctor that accepts an `UInt`
//
//    - throws:
//    `DescribedError` if something went wrong
//    */
    public convenience init(quantity: UInt) throws {
        fatalError("f")
    }

    /**
    Converts an ethereum `Quantity` to `String` dropping leading zeroes

    - returns:
    `Any` which should be a `String`
    */
    public func value() throws -> Any {
        fatalError("g")
    }

}
