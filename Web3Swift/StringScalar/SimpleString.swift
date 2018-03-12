//
// Created by Timofey on 3/7/18.
//

import Foundation

//Anonymous string scalar wrapper
public final class SimpleString: StringScalar {

    private let computation: () throws -> (String)

    /**
    Ctor

    - parameters:
        - computation: computation that produces a `String` representation of a string
    */
    init(computation: @escaping () throws -> (String)) {
        self.computation = computation
    }

    /**
    Ctor

    - parameters:
        - string: `String` to be wrapped into scalar
    */
    convenience init(string: String) {
        self.init(computation: { string })
    }

    /**
    - returns:
    `String` representation of a string scalar

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        return try computation()
    }

}