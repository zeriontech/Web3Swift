import Foundation
import SwiftyJSON

class GetGasPriceProcedure: RemoteProcedure {
    
    private var network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_gasPrice",
                params: []
            )
        )
    }
    
}
