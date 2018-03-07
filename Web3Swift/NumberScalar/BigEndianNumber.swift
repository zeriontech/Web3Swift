//
// Created by Timofey on 3/6/18.
//

import CryptoSwift
import Foundation

private final class IntegerBytesOverflowError: DescribedError {

    private let bytes: Data
    private let sizeLimit: Int
    init(bytes: Data, sizeLimit: Int) {
        self.bytes = bytes
        self.sizeLimit = sizeLimit
    }

    var description: String {
        return "Integer with hex representation \(bytes.toHexString()) exceeds maximum size \(sizeLimit) by \(bytes.count - sizeLimit)"
    }

}

public final class BigEndianNumber: NumberScalar {

    private let bytes: BytesScalar
    init(bytes: BytesScalar) {
        self.bytes = bytes
    }

    convenience init(uint: UInt) {
        self.init(
            bytes: IntegerBytes(
                uint: uint.bigEndian
            )
        )
    }

    convenience init(hex: StringScalar) {
        self.init(
            bytes: BytesFromHexString(
                hex: hex
            )
        )
    }

    public func hex() throws -> BytesScalar {
        return bytes
    }

    public func uint() throws -> UInt {
        let bytes = try self.bytes.value()
        guard bytes.count <= MemoryLayout<UInt>.size else {
            throw IntegerBytesOverflowError(
                bytes: bytes,
                sizeLimit: MemoryLayout<UInt>.size
            )
        }
        var integer = UInt(0).bigEndian
        bytes.forEach{ byte in
            integer = integer << 8
            integer = integer | UInt(byte)
        }
        return integer
    }

}