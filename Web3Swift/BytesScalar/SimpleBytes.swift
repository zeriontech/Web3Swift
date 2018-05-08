//
// Created by Timofey on 3/6/18.
//

import CryptoSwift
import Foundation

//Anonymous class for evaluating bytes
public final class SimpleBytes: BytesScalar {

    private let valueComputation: () throws -> (Data)

    /**
    Ctor

    - parameters:
        - valueComputation: closure which returns bytes as `Data`
    */
    public init(valueComputation: @escaping () throws -> (Data)) {
        self.valueComputation = valueComputation
    }

    /**
    Ctor

    - parameters:
        - bytes: bytes as `Data` to be wrapped into scalar
    */
    public convenience init(bytes: Data) {
        self.init(valueComputation: { bytes })
    }

    /**
    Ctor

    - parameters:
        - bytes: bytes as `Array<UInt8>` to be wrapped into scalar
    */
    public convenience init(bytes: Array<UInt8>) {
        self.init(valueComputation: { Data(bytes: bytes) })
    }

    /**
    - returns:
    bytes represented as `Data`

    - throws:
    `DescribedError` if something goes wrong.
    */
    public func value() throws -> Data {
        return try valueComputation()
    }

}
