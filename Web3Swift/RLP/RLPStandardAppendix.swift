//
// Created by Timofey on 1/29/18.
//

import Foundation

public final class BytesLengthOverflow: Swift.Error { }

internal final class RLPStandardAppendix: RLPAppendix {

    private let offset: UInt8
    public init(offset: UInt8) {
        self.offset = offset
    }

    internal func applying(to bytes: Data) throws -> Data {
        switch bytes.count {
        case 0...55:
            return Data(
                bytes: [
                    UInt8(
                        UInt8(bytes.count) + offset
                    )
                ]
            ) + bytes
        case 56...Int.max:
            return try Data(
                bytes: [
                    UInt8(bytes.count.unsignedByteWidth() + Int(offset) + 55)
                ]
            ) + LeadingCompactBytes(
                origin: IntegerBytes(
                    uint: UInt(bytes.count).bigEndian
                )
            ).value() + bytes
        default:
            throw BytesLengthOverflow()
        }
    }

}
