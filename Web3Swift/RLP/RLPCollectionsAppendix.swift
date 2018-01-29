//
// Created by Timofey on 1/29/18.
//

import Foundation

final class RLPCollectionAppendix: RLPAppendix {

    func applying(to bytes: Data) throws -> Data {
        return try RLPStandardAppendix(
            offset: 0xc0
        ).applying(to: bytes)
    }

}