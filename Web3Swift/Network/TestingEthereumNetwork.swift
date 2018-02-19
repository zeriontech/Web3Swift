import Foundation

class TestingEthereumNetwork: Network {
    
    private var network: SimpleNetwork
    
    init() throws {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let infura = MainnetInfuraNetwork()
        
        let apiKey = "metamask"
        
        guard let infuraUrl = URL(string: "https://"+infura.toString()+".infura.io/"+apiKey) else {
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

