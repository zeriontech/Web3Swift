//
// Created by Timofey on 3/7/18.
//

import Foundation

internal final class IncorrectBytesLengthError: DescribedError {

    private let length: UInt
    private let bytes: Data
    public init(bytes: Data, length: UInt) {
        self.bytes = bytes
        self.length = length
    }

    public var description: String {
        return "Received bytes of size \(bytes.count) when \(length) was expected"
    }

}

//Bytes with a fixed length
public final class FixedLengthBytes: BytesScalar {

    private let origin: BytesScalar
    private let length: UInt

    /**
    Ctor

    - parameters:
        - origin: bytes to be evaluated
        - length: expected length
    */
    public init(origin: BytesScalar, length: UInt) {
        self.origin = origin
        self.length = length
    }

    /**
    - returns:
    bytes as `Data` of the specified `length`

    - throws:
    `DescribedError` if something went wrong or if bytes were of different length than specified
    */
    public func value() throws -> Data {
        let bytes = try origin.value()
        guard bytes.count == length else {
            throw IncorrectBytesLengthError(
                bytes: bytes,
                length: length
            )
        }
        return bytes
    }

}
