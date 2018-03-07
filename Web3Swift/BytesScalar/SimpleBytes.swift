//
// Created by Timofey on 3/6/18.
//

import CryptoSwift
import Foundation

public final class SimpleBytes: BytesScalar {

    private let valueComputation: () throws -> (Data)
    init(valueComputation: @escaping () throws -> (Data)) {
        self.valueComputation = valueComputation
    }

    convenience init(bytes: Data) {
        self.init(valueComputation: { bytes })
    }

    convenience init(bytes: Array<UInt8>) {
        self.init(valueComputation: { Data(bytes: bytes) })
    }

    public func value() throws -> Data {
        return try valueComputation()
    }

}