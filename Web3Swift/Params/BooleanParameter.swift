import Foundation

public final class BooleanParameter: GethParameter {
    
    private var param: Bool
    
    init(value: Bool) {
        self.param = value
    }

    public func value() throws -> Any {
        return param
    }
    
}
