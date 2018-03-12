//
// Created by Timofey on 3/8/18.
//

import Foundation

//Bytes of the string in UTF8 representation
public final class UTF8StringBytes: BytesScalar {

    private let string: StringScalar

    /**
    Ctor

    - parameters:
        - string: string to be evaluated for bytes
    */
    init(string: StringScalar) {
        self.string = string
    }

    /**
    Ctor

    - parameters:
        - string: string to be evaluated for bytes
    */
    convenience init(string: String) {
        self.init(
            string: SimpleString{ string }
        )
    }

    /**
    - returns:
    bytes as `Data` of the string interpreted as utf8 bytes collection

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        return try Data(
            bytes: Array(
                string.value().utf8
            )
        )
    }

}