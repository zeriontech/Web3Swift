//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

public final class InvalidAddressError: Swift.Error { }

public final class SimpleAddress: Address {

    private let value: String
    
    init(hex: Hex) throws {
        guard hex.toString().count == 40 else { throw InvalidAddressError() }
        self.value = hex.toPrefixString()
    }

    public func toString() -> String {
        return value
    }
    
    private lazy var asData: Data = Data(hex: self.value.removingHexPrefix())
    public func toData() -> Data {
        return asData
    }

}
