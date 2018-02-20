//
// Created by Timofey on 1/29/18.
//

import Foundation

public final class BytesLengthOverflow: Swift.Error { }

internal final class RLPStandardAppendix: RLPAppendix {

    private let offset: UInt8
    init(offset: UInt8) {
        self.offset = offset
    }

    func applying(to bytes: Data) throws -> Data {
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
            return Data(
                bytes: [
                    UInt8(bytes.count.unsignedByteWidth() + Int(offset) + 55)
                ]
            ) + Data(
                integer: UInt(bytes.count).bigEndian
            ).droppingLeadingZeroes() + bytes
        default:
            throw BytesLengthOverflow()
        }
    }

}