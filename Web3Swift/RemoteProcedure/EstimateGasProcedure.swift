import Foundation
import SwiftyJSON

class EstimateGasProcedure: RemoteProcedure {
    
    private let network: Network
    private let transactionRequest: TransactionRequest
    
    init(network: Network, transactionRequest: TransactionRequest) {
        self.network = network
        self.transactionRequest = transactionRequest
    }
    
    func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_estimateGas",
                params: [
                    ObjectParameter(dictionary: transactionRequest.serialise())
                ]
            )
        )
    }
    
}
