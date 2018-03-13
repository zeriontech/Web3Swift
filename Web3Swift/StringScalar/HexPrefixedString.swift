//
// Created by Timofey on 3/13/18.
//

import Foundation

//String that is prefixed by 0x
public final class HexPrefixedString: StringScalar {

    private let origin: StringScalar

    /**
    Ctor

    - parameters:
        - origin: string to be prefixed
    */
    init(origin: StringScalar) {
        self.origin = PrefixedString(
            origin: origin,
            prefix: HexPrefix()
        )
    }

    /**
    - returns:
    String that is prefixed by 0x

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        return try origin.value()
    }

}