import Foundation

class BooleanParameter: GethParameter {
    
    private var param: Bool
    
    init(value: Bool) {
        self.param = value
    }
    
    func value() throws -> Any {
        return param
    }
    
}
