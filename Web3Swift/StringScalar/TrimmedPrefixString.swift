//
// Created by Timofey on 3/7/18.
//

import Foundation

//String with trimmed prefix if one exists
public final class TrimmedPrefixString: StringScalar {

    private let string: StringScalar
    private let prefix: StringScalar

    /**
    Ctor

    - parameters:
        - string: string to trim
        - prefix: prefix to search and trim
    */
    init(string: StringScalar, prefix: StringScalar) {
        self.string = string
        self.prefix = prefix
    }

    /**
    - returns:
    `String` representation of a string without the specified prefix

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
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