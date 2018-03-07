import Foundation

/// Error describes invalid length of transaction hash provided
public final class IncorrectTxHashLengthError: DescribedError {
    
    private let length: Int
    
    public init(length: Int) {
        self.length = length
    }
    
    public var description: String {
        return "Hex returned \(self.length) characters string when 64 was expected"
    }
    
}

public final class TransactionHashParameter: EthParameter {
    
//    private var transactionHash: Hex
    init(transactionHash: BytesScalar) {
        fatalError("e")
    }

//    guard transactionHash.toString().count == 64 else {
//            throw IncorrectTxHashLengthError(
//                length: transactionHash.toString().count
//            )
//        }
//        return transactionHash.toPrefixString()
    public func value() throws -> Any {
        fatalError("g")
    }
    
}
