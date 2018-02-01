import Foundation

protocol TransactionRequest {
    
    func serialise() -> Dictionary<String,GethParameter>
    
}
