import Foundation
import SwiftyJSON

class EstimateGasProcedure: RemoteProcedure {
    
    private let network: Network
    private let blockChainState: BlockChainState
    private let transactionRequest: TransactionRequest
    
    init(network: Network, transactionRequest: TransactionRequest, blockChainState: BlockChainState) {
        self.network = network
        self.blockChainState = blockChainState
        self.transactionRequest = transactionRequest
    }
    
    func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_estimateGas",
                params: [
                    ObjectParameter(dictionary: transactionRequest.serialise()),
                    TagParameter(state: blockChainState)
                ]
            )
        )
    }
    
}
