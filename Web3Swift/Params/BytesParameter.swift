//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class BytesParameter: EthParameter {

    private let bytes: BytesScalar

    /**
    Ctor

    - parameters:
        - bytes: unstructed data to be passed to network
    */
    public init(bytes: BytesScalar) {
        self.bytes = bytes
    }

    /**
    - returns:
    `String` representation of the unstructured bytes as specified by ethereum JSON RPC

    - throws:
    `DescribedError` is something went wrong
    */
    public func value() throws -> Any {
        return try PrefixedHexString(
            bytes: bytes
        ).value()
    }

}
