import Foundation

public class MainnetInfuraNetwork: NetworkAdapter {
    
    private var session: URLSession
    private var url: URL
    private var headers: Dictionary<String, String>
    
    init(apiKey: String) throws {
        session = URLSession(configuration: URLSessionConfiguration.default)
        guard let infuraUrl = URL(string: "https://mainnet.infura.io/"+apiKey) else {
            throw  NetworkError("Invalid url")
        }
        url = infuraUrl
        headers = [:]
    }
    
    public func getSession() -> URLSession {
        return session
    }
    
    public func getUrl() -> URL {
        return url
    }

    public func getHeaders() -> Dictionary<String, String> {
        fatalError("getHeaders() has not been implemented")
    }

}
