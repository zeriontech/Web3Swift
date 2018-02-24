import Foundation

fileprivate class InvalidTransactionHashError: Swift.Error { }

public final class TransactionHashParameter: GethParameter {
    
    private var transactionHash: Hex
    
    init(transactionHash: Hex) {
        self.transactionHash = transactionHash
    }

    public func value() throws -> Any {
        guard transactionHash.toString().count == 64 else { throw InvalidTransactionHashError() }
        return transactionHash.toPrefixString()
    }
    
}
