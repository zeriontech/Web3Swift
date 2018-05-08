//
// Created by Timofey on 3/13/18.
//

import Foundation

/**
An encoding specific to ethereum quantities

Ethereum imposes a specific requirement on RLP encoding for quantities:
https://ethereum.stackexchange.com/questions/30518/does-rlp-specify-integer-encoding
*/
public final class EthRLP: RLP {

    private let number: NumberScalar

    /**
    Ctor
    
    - parameters: 
        - number: number to be encoded
    */
    public init(number: NumberScalar) {
        self.number = number
    }

    /**
    - returns:
    Bytes as `Data` representing RLP encoded ethereum quantity encoding 0 as empty byte array 
    
    - throws:
    `DescribedError` if something went wrong 
    */
    public func value() throws -> Data {
        let encodedNumber = try SimpleRLP(
            bytes: number.hex()
        ).value()
        if encodedNumber == Data(bytes: [0x00]) {
            return try SimpleRLP(
                bytes: []
            ).value()
        } else {
            return encodedNumber
        }
    }

}
