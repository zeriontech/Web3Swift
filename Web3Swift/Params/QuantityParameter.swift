import Foundation

class QuantityParameter: GethParameter {

    private var quantity: UInt64

    init(quantity: UInt64) {
        self.quantity = quantity
    }

    func value() -> Any {
        return String(format:"%2X", quantity).addingHexPrefix()
    }
}
