import Foundation

public final class StringParameter: EthParameter {

    private var param: StringScalar
    init(value: StringScalar) {
        self.param = value
    }

    convenience init(value: String) {
        self.init(value: SimpleString{ value })
    }

    public func value() throws -> Any {
        return try param.value()
    }
}
