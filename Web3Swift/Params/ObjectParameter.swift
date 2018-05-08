import Foundation
import SwiftyJSON

public final class ObjectParameter: EthParameter {

    private let dictionary: Dictionary<String, EthParameter>
    public init(dictionary: Dictionary<String, EthParameter>) {
        self.dictionary = dictionary
    }

    public func value() throws -> Any {
        return try dictionary.mapValues {
            try $0.value()
        }
    }

}
