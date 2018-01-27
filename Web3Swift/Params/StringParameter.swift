import Foundation

class StringParameter: GethParameter {

    private var param: String

    init(value: String) {
        self.param = value
    }

    func value() throws -> Any {
        return param
    }
}
