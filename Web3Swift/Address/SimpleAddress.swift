//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

/// Error describes invalid length of ethereum address provided
public final class IncorrectAddressLengthError: DescribedError {
    
    private let length: Int
    
    public init(length: Int) {
        self.length = length
    }
    
    public var description: String {
        return "Hex returned \(self.length) characters string when 40 was expected"
    }
    
}

/// Ethereum address object basic implementation
public final class SimpleAddress: Address {
    
    private let value: String
    
    /**
    ctor
     
    - throws:
    An error of type `InvalidAddressLengthError`
     
    - parameters:
        - hex: A valid hex string wrapped in `Hex` object.
     */
    init(hex: Hex) throws {
        guard hex.toString().count == 40 else { throw IncorrectAddressLengthError(length: hex.toString().count) }
        self.value = hex.toPrefixString()
    }

    /**
    Converts Ethereum address to string
     
    - returns:
    A prefixed hex string of length 40
     */
    public func toString() -> String {
        return value
    }
    
    private lazy var asData: Data = Data(hex: self.value.removingHexPrefix())
    public func toData() -> Data {
        return asData
    }

}
