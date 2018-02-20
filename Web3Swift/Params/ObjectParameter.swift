import Foundation
import SwiftyJSON

public final class ObjectParameter: GethParameter {

    private var dictionary: Dictionary<String, GethParameter>

    init(dictionary: Dictionary<String, GethParameter>) throws {
        self.dictionary = dictionary
    }

    public func value() throws -> Any {
        return try dictionary.mapValues {
            try $0.value()
        }
    }
}