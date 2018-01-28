import Foundation

fileprivate class InvalidTransactionHashError: Swift.Error { }

class TransactionHashParameter: GethParameter {
    
    private var transactionHash: String
    
    init(transactionHash: String) {
        
        self.transactionHash = transactionHash
        
    }
    
    func value() throws -> Any {

        if(!transactionHash.isHex())
        {
            throw InvalidTransactionHashError()
        }

        if(transactionHash.removeHexPrefix().count != 32)
        {
            throw InvalidTransactionHashError()
        }

        return transactionHash.addHexPrefix()
    }
    
}
