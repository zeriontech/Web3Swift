import Foundation

class StringParameter: GethParameter {

    private var value: String

    init(value: String) {
        self.value = value
    }

    func value() throws -> Any {
        return value
    }
}
