import Foundation
import SwiftyJSON

public class GetGasPriceProcedure: RemoteProcedure {
    
    private var network: Network
    
    public init(network: Network) {
        self.network = network
    }
    
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_gasPrice",
                params: []
            )
        )
    }
    
}
