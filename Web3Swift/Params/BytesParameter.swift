//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class BytesParameter: EthParameter {

    private let bytes: BytesScalar
    init(bytes: BytesScalar) {
        self.bytes = bytes
    }

    public func value() throws -> Any {
        return try PrefixedHexString(
            bytes: bytes
        ).value()
    }

}