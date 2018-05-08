import Foundation

public final class BooleanParameter: EthParameter {
    
    private var param: Bool
    
    public init(value: Bool) {
        self.param = value
    }

    public func value() throws -> Any {
        return param
    }
    
}
