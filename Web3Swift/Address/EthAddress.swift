//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

/// Standard 20 bytes ethereum address
public final class EthAddress: BytesScalar {
    
    private let bytes: BytesScalar

    /**
    Ctor

    - parameters:
        - bytes: `BytesScalar` with a `value` count of 20
    */
    init(bytes: BytesScalar) {
        self.bytes = FixedLengthBytes(
            origin: bytes,
            length: 20
        )
    }

    /**
    Ctor

    - parameters:
        - hex: `StringScalar` representing bytes of the address in hex format
    */
    convenience init(hex: StringScalar) {
        self.init(
            bytes: BytesFromHexString(
                hex: hex
            )
        )
    }

    /**
    Ctor

    - parameters:
        - hex: `String` representing bytes of the address in hex format
    */
    convenience init(hex: String) {
        self.init(
            hex: SimpleString{
                hex
            }
        )
    }

    /**
    Bytes representation of ethereum address

    - returns:
    20 bytes `Data`

    - throws:
    `DescribedError` if something went wrong (i.e. bytes are not length 20)
    */
    public func value() throws -> Data {
        return try bytes.value()
    }

}
