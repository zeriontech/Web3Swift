//
// Created by Timofey on 1/21/18.
//

import Foundation
import SwiftyJSON

internal class InvalidTypeError<T>: DescribedError {

    private let json: JSON
    private let typeName: String
    init(json: JSON, expectedType: T.Type) {
        self.json = json
        self.typeName = String(describing: expectedType)
    }

    var description: String {
        return "Expected type was \(typeName) but it was actually \(String(describing: json.type))"
    }

}

extension JSON {

    init(dictionary: [String: Any]) {
        self.init(dictionary)
    }

    /**
    - returns:
    `Int` representation from `JSON` value
    
    - throws:
    `DescribedError` if the type was not an `Int`
    */
    func int() throws -> Int {
        if let int = self.int {
            return int
        } else {
            throw InvalidTypeError(json: self, expectedType: Int.self)
        }
    }

    /**
    - returns:
    `String` representation from `JSON` value
    
    - throws:
    `DescribedError` if the type was not an `String`
    */
    func string() throws -> String {
        if let string = self.string {
            return string
        } else {
            throw InvalidTypeError(json: self, expectedType: String.self)
        }
    }

}
