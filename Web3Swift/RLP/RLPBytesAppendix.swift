//
// Created by Timofey on 1/29/18.
//

import Foundation

final class RLPBytesAppendix: RLPAppendix {

    func applying(to bytes: Data) throws -> Data {
        switch bytes.count {
        case 1:
            return bytes
        default:
            return try RLPStandardAppendix(
                offset: 0x80
            ).applying(to: bytes)
        }
    }

}