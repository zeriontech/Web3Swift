import Foundation

final class TestingAddress: Address {
    
    private let value: String
    
    init() {
        self.value = "0x0aD9Fb61a07BAC25625382B63693644497f1B204"
    }
    
    func toString() -> String {
        return value
    }
    
    private lazy var asData: Data = Data(hex: self.value.removingHexPrefix())
    
    func toData() -> Data {
        return asData
    }
    
}
