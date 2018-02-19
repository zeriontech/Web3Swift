import Foundation

class ParityNetwork: Network {
    
    private var network: SimpleNetwork
    
    init(url: String) throws {
        
        guard let parityUrl = URL(string: url) else {
            throw  NetworkError("Invalid url")
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let parityHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        network = SimpleNetwork(session: session, url: parityUrl, headers: parityHeaders)
        
    }
    
    init(ip: String, port: String, isSecureConnection: Bool) throws {
        
        let prefix = (isSecureConnection) ? "https" : "http"
        
        guard let parityUrl = URL(string: prefix+"://"+ip+":"+port) else {
            throw  NetworkError("Invalid url")
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let parityHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        network = SimpleNetwork(session: session, url: parityUrl, headers: parityHeaders)
        
    }
    
    func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try network.call(method: method, params: params)
    }
    
}

