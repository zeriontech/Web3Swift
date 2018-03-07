//
// Created by Timofey on 3/7/18.
//

import Foundation

public final class SimpleString: StringScalar {

    private let computation: () throws -> (String)
    init(computation: @escaping () throws -> (String)) {
        self.computation = computation
    }

    func value() throws -> String {
        return try computation()
    }

}