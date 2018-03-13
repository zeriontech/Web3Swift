//
// Created by Timofey on 1/28/18.
//

import Foundation

public final class SimpleRLP: RLP {

    private let bytes: BytesScalar
    private let appendix: RLPAppendix

    private init(bytes: BytesScalar, appendix: RLPAppendix) {
        self.bytes = bytes
        self.appendix = appendix
    }

    convenience init(bytes: BytesScalar) {
        self.init(
            bytes: bytes,
            appendix: RLPBytesAppendix()
        )
    }

    convenience init(bytes: Data) {
        self.init(
            bytes: SimpleBytes(
                bytes: bytes
            )
        )
    }

    convenience init(bytes: Array<UInt8>) {
        self.init(
            bytes: SimpleBytes(
                bytes: bytes
            )
        )
    }

    convenience init(rlps: [RLP]) {
        self.init(
            bytes: ConcatenatedBytes(bytes: rlps),
            appendix: RLPCollectionAppendix()
        )
    }

    public func value() throws -> Data {
        return try appendix.applying(to: bytes.value())
    }

}
