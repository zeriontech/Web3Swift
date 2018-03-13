//
// Created by Timofey on 3/13/18.
//

import Foundation

//Just a hex perfix
public final class HexPrefix: StringScalar {

    /**
    - returns:
    "0x" string

    - throws:
    doesn't throw
    */
    public func value() throws -> String {
        return "0x"
    }

}
