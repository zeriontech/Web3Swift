//
// Created by Timofey on 1/20/18.
//

import CryptoSwift
import Foundation

/// Ethereum address object basic implementation
public final class EthAddress: BytesScalar {
    
    private let bytes: BytesScalar
    init(bytes: BytesScalar) {
        self.bytes = FixedLengthBytes(
            origin: bytes,
            length: 20
        )
    }

    convenience init(hex: StringScalar) {
        self.init(
            bytes: BytesFromHexString(
                hex: hex
            )
        )
    }

    convenience init(hex: String) {
        self.init(
            hex: SimpleString{
                hex
            }
        )
    }

    public func value() throws -> Data {
        return try bytes.value()
    }

}
