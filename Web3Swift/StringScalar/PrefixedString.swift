//
// Created by Timofey on 3/13/18.
//

import Foundation

//String that is prefixed
public final class PrefixedString: StringScalar {

    private let origin: StringScalar
    private let prefix: StringScalar

    /**
    Ctor

    - parameters:
        - origin: origin to be prefixed
        - prefix: prefix to persist
    */
    init(
        origin: StringScalar,
        prefix: StringScalar
    ) {
        self.origin = origin
        self.prefix = prefix
    }

    /**
    - returns:
    `String` that is prefixed by the specified prefix if one doesn't exist

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        let origin = try self.origin.value()
        let prefix = try self.prefix.value()
        if origin.hasPrefix(prefix) {
            return origin
        } else {
            return "\(prefix)\(origin)"
        }
    }

}