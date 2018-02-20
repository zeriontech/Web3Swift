import Foundation

public final class TestingEthereumNetwork: Network {
    
    private var infura: InfuraNetwork
    
    init() throws {
        infura = try InfuraNetwork(chain: "mainnet", apiKey: "metamask")
    }
    
    public func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try infura.call(method: method, params: params)
    }
    
}

