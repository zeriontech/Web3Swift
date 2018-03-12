//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation

private final class AmbiguousHexStringError: DescribedError {

    private let hex: String
    init(hex: String) {
        self.hex = hex
    }

    var description: String {
        return "Hex string \(hex) length \(hex.count) is not even"
    }

}

private final class IncorrectHexCharacterError: DescribedError {

    private let hex: String

    public init(hex: String) {
        self.hex = hex
    }

    public var description: String {
        //TODO: Highlight incorrect characters here
        return "Incorrect hex string \"\(self.hex)\""
    }

}

//A string that represents some collection of hexadecimal numbers
public final class HexString: StringScalar {

    private let hex: StringScalar

    /**
    Ctor

    - parameters:
        - hex: a string describing a hexadecimal
    */
    init(hex: StringScalar) {
        self.hex = hex
    }

    /**
    Ctor

    - parameters:
        - hex: a string describing a hexadecimal
    */
    convenience init(hex: String) {
        self.init(
            hex: SimpleString(
                string: hex
            )
        )
    }

    /**
    - returns:
    `String` representation of a string describing a hexadecimal

    - throws:
    `DescribedError` if something went wrong or if string does not describe a hexadecimal or hexadecimal description is ambiguous
    */
    public func value() throws -> String {
        let hex = try self.hex.value()
        guard hex.count.isEven() else { throw AmbiguousHexStringError(hex: hex) }
        guard try NSRegularExpression(pattern: "(0[xX]){0,1}[0-9a-fA-F]+").matches(
            in: hex,
            range: NSRange((0..<hex.count))
        ).count == 1 else {
            throw IncorrectHexCharacterError(hex: hex)
        }
        return hex
    }

}