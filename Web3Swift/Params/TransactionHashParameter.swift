import Foundation

fileprivate class InvalidTransactionHashError: Swift.Error { }

public final class TransactionHashParameter: GethParameter {
    
    private var transactionHash: String
    
    init(transactionHash: String) {
        self.transactionHash = transactionHash
    }

    public func value() throws -> Any {
        guard transactionHash.isHex(), transactionHash.removingHexPrefix().count == 32 else { throw InvalidTransactionHashError() }
        return transactionHash.addingHexPrefix()
    }
    
}
