//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class TrimmedPrefixString: StringScalar {

    private let string: StringScalar
    private let prefix: StringScalar
    init(string: StringScalar, prefix: StringScalar) {
        self.string = string
        self.prefix = prefix
    }

    func value() throws -> String {
        let string = try self.string.value()
        let prefix = try self.prefix.value()
        if string.hasPrefix(prefix) {
            return String(
                string.dropFirst(
                    Int(prefix.count)
                )
            )
        } else {
            return string
        }
    }

}