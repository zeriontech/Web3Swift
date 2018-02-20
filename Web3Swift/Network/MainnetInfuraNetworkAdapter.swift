import Foundation

class MainnetInfuraNetwork: NetworkAdapter {
    
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
    
    func getSession() -> URLSession {
        return session
    }
    
    func getUrl() -> URL {
        return url
    }

    func getHeaders() -> Dictionary<String, String> {
        fatalError("getHeaders() has not been implemented")
    }

}
