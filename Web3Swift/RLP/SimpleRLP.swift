//
// Created by Timofey on 1/28/18.
//

import Foundation

public final class SimpleRLP: RLP {

    private let lazyBytes: () throws -> (Data)
    private let appendix: RLPAppendix
    init(bytes: Data) {
        self.lazyBytes = { bytes }
        self.appendix = RLPBytesAppendix()
    }

    init(rlps: [RLP]) throws {
        self.lazyBytes = { try rlps.map{ try $0.toData() }.reduce(Data()) { $0 + $1 } }
        self.appendix = RLPCollectionAppendix()
    }

    public func toData() throws -> Data {
        return try appendix.applying(to: lazyBytes())
    }

}