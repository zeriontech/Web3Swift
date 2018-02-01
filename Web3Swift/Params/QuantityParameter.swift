import Foundation

class QuantityParameter: GethParameter {

    private var quantity: UInt64

    init(quantity: UInt64) {
        self.quantity = quantity
    }
    //TODO: Fix formating here for numbers less that 16
    func value() -> Any {
        return String(format:"%X", quantity).addingHexPrefix()
    }
}
