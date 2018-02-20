import Foundation

public final class StringParameter: GethParameter {

    private var param: String

    init(value: String) {
        self.param = value
    }

    public func value() throws -> Any {
        return param
    }
}
