//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

public final class InvalidAddressError: Swift.Error { }

public final class SimpleAddress: Address {

    private let value: String
    
    init(value: String) throws {
        guard value.isHex() && value.removingHexPrefix().count == 40 else { throw InvalidAddressError() }
        self.value = value.addingHexPrefix()
    }

    public func toString() -> String {
        return value
    }
    
    private lazy var asData: Data = Data(hex: self.value.removingHexPrefix())
    public func toData() -> Data {
        return asData
    }

}
