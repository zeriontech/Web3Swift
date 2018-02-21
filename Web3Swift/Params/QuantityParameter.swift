import Foundation

public final class QuantityParameter: GethParameter {

    private var quantity: Int

    init(quantity: Int) {
        self.quantity = quantity
    }

    public func value() throws -> Any {
        return String(format: "%X", quantity).addingHexPrefix()
    }
}
