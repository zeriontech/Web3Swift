import Foundation

public final class GethNetwork: Network {
    
    private var network: SimpleNetwork
    
    private init(url: URL) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let gethHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        network = SimpleNetwork(session: session, url: url, headers: gethHeaders)
    }
    
    convenience init(url: String) throws {
        guard let gethUrl = URL(string: url) else {
            throw  NetworkError("Invalid url")
        }
        print(gethUrl)
        self.init(url: gethUrl)
    }
    
    convenience init(ip: String, port: String, isSecureConnection: Bool) throws {
        let prefix = (isSecureConnection) ? "https" : "http"
        guard ip.range(of: "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$", options: [.regularExpression, .caseInsensitive]) != nil else {
            throw  NetworkError("Invalid IP")
        }
        guard let gethUrl = URL(string: prefix+"://"+ip+":"+port) else {
            throw  NetworkError("Invalid url")
        }
        self.init(url: gethUrl)
    }

    public func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try network.call(method: method, params: params)
    }
    
}
