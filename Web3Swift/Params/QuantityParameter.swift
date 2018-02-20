import Foundation

public final class QuantityParameter: GethParameter {

    private var quantity: Int

    init(quantity: Int) throws {
        self.quantity = quantity
    }

    public func value() -> Any {
        return String(format: "%2X", quantity).addingHexPrefix()
    }
}
