import Foundation

//infura.io network
public final class InfuraNetwork: Network {
    
    private let origin: GethNetwork

    /**
    Ctor

    - parameters:
        - chain: chain identifier
        - apiKey: api key for accessing JSON RPC calls
    */
    init(chain: String, apiKey: String) {
        origin = GethNetwork(url: "https://"+chain+".infura.io/"+apiKey)
    }

    /**
    - returns:
    id of a network

    - throws:
    `DescribedError` if something went wrong
    */
    public func id() throws -> NumberScalar {
        return try origin.id()
    }

    /**
    - returns:
    `Data` for a JSON RPC call

    - throws:
    `DescribedError` if something went wrong
    */
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try origin.call(method: method, params: params)
    }
    
}
