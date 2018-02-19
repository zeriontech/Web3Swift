import Foundation

class InfuraNetwork: Network {
    
    private var network: SimpleNetwork
    
    init(chain: InfuraChain, apiKey: String) throws {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        guard let infuraUrl = URL(string: "https://"+chain.toString()+".infura.io/"+apiKey) else {
            throw  NetworkError("Invalid url")
        }
        
        let infuraHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        network = SimpleNetwork(session: session, url: infuraUrl, headers: infuraHeaders)
    }
    
    func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try network.call(method: method, params: params)
    }
    
}
