//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class MergedBytes: BytesScalar {

    private let bytes: [BytesScalar]
    init(bytes: [BytesScalar]) {
        self.bytes = bytes
    }

    public func value() throws -> Data {
        return try bytes.reduce(Data()) {
            try $0 + $1.value()
        }
    }

}