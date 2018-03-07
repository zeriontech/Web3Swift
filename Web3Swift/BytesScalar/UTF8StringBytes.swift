//
// Created by Timofey on 3/8/18.
//

import Foundation

public final class UTF8StringBytes: BytesScalar {

    private let string: StringScalar
    init(string: StringScalar) {
        self.string = string
    }

    convenience init(string: String) {
        self.init(
            string: SimpleString{ string }
        )
    }

    public func value() throws -> Data {
        return try Data(
            bytes: Array(
                string.value().utf8
            )
        )
    }

}