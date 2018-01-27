import Foundation

class QuantityParameter: GethParameter {

    private var quantity: Int

    init(quantity: Int) throws {
        self.quantity = quantity
    }

    func value() -> Any {
        return String(format:"%2X", quantity).addHexPrefix()
    }
}
