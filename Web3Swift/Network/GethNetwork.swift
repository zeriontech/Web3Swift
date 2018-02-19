import Foundation

class GethNetwork: Network {
    
    private var network: SimpleNetwork
    
    init(url: String) throws {
        
        guard let gethUrl = URL(string: url) else {
            throw  NetworkError("Invalid url")
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let gethHeaders = [String: String]()
        
        network = SimpleNetwork(session: session, url: gethUrl, headers: gethHeaders)
        
    }
    
    init(ip: String, port: String, isSecureConnection: Bool) throws {
        
        let prefix = (isSecureConnection) ? "https" : "http"
        
        guard let gethUrl = URL(string: prefix+"://"+ip+":"+port) else {
            throw  NetworkError("Invalid url")
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let gethHeaders = [String: String]()
        
        network = SimpleNetwork(session: session, url: gethUrl, headers: gethHeaders)
        
    }
    
    func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try network.call(method: method, params: params)
    }
    
}
