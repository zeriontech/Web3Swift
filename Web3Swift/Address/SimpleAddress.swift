//
// Created by Timofey on 1/20/18.
//

import Foundation
import CryptoSwift

class InvalidAddressError: Swift.Error { }

final class SimpleAddress: Address {

    private let value: String
    
    init(value: String) throws {
        guard value.isHex() && value.removingHexPrefix().count == 40 else { throw InvalidAddressError() }
        self.value = value.addingHexPrefix()
    }

    func toString() -> String {
        return value
    }
    
    private lazy var asData: Data = Data(hex: self.value.removingHexPrefix())
    func toData() -> Data {
        return asData
    }

}
