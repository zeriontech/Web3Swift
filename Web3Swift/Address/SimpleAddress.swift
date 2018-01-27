//
// Created by Timofey on 1/20/18.
//

import Foundation

fileprivate class InvalidAddressError: Swift.Error { }

final class SimpleAddress: Address {

    private let value: String
    
    init(value: String) throws {
        
        if(!value.isHex())
        {
            throw InvalidAddressError()
        }
        
        if(value.removeHexPrefix().count != 40)
        {
            throw InvalidAddressError()
        }
        
        self.value = value.addHexPrefix()
        
    }

    func toString() -> String {
        return value
    }

}
