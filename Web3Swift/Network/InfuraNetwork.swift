import Foundation

public final class InfuraNetwork: Network {
    
    private var geth: GethNetwork
    
    init(chain: String, apiKey: String) throws {
        geth = try GethNetwork(url: "https://"+chain+".infura.io/"+apiKey)
    }
    
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try geth.call(method: method, params: params)
    }
    
}
