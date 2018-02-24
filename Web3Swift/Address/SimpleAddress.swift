//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

public final class InvalidAddressLengthError: Swift.Error { }

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
        guard hex.toString().count == 40 else { throw InvalidAddressLengthError() }
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
