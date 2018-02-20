import Foundation

public final class AddressParameter: GethParameter {
    
    private var address: Address
    
    init(address: Address) {
        self.address = address
    }

    public func value() throws -> Any {
        return address.toString()
    }
    
}
