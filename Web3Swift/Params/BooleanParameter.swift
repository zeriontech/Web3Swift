import Foundation

class BooleanParameter: GethParameter {
    
    private var value : Bool
    
    init(value: Bool) {
        self.value = value
    }
    
    func value() throws -> Any {
        return value
    }
    
}
