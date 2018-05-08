import Foundation

//A network of go ethereum implementation
public final class GethNetwork: Network {
    
    private let origin: EthNetwork

    /**
    - parameters:
        - url: url for accessing JSON RPC
    */
    init(url: String) {
        self.origin = EthNetwork(
            session: URLSession(configuration: URLSessionConfiguration.default),
            url: url,
            headers: [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        )
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
