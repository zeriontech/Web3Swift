//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class LeadingCompactBytes: BytesScalar {

    private let origin: BytesScalar
    init(origin: BytesScalar) {
        self.origin = origin
    }

    public func value() throws -> Data {
        let bytes = try origin.value()
        return bytes.dropLast().drop(while: { $0 == 0 }) + [bytes.last].flatMap{ $0 }
    }

}