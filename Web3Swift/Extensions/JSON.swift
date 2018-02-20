//
// Created by Timofey on 1/21/18.
//

import Foundation
import SwiftyJSON

fileprivate class InvalidTypeError: Swift.Error {



}

extension JSON {

    init(dictionary: [String: Any]) {
        self.init(dictionary)
    }

    func int() throws -> Int {
        if let int = self.int {
            return int
        } else {
            throw InvalidTypeError()
        }
    }

    func string() throws -> String {
        if let string = self.string {
            return string
        } else {
            throw InvalidTypeError()
        }
    }

}
