import Foundation
import SwiftyJSON

class ObjectParameter: GethParameter {

    private var dictionary: Dictionary<String, GethParameter>

    init(dictionary: Dictionary<String,GethParameter>) {
        self.dictionary = dictionary
    }

    func value() throws -> Any {
        return try dictionary.mapValues {
            try $0.value()
        }
    }
}
