import Foundation

class AddressParameter: GethParameter {
    
    private var address: Address
    
    init(address: Address) {
        self.address = address
    }
    
    func value() throws -> Any {
        return address.toString()
    }
    
}
