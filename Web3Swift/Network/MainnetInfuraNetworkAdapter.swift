import Foundation

class MainnetInfuraNetwork: NetworkAdapter {
    
    private var session: URLSession
    private var url: URL
    private var headers: Array<String, String>
    
    init(apiKey: String) throws {
        session = URLSession(configuration: URLSessionConfiguration.default)
        guard let infuraUrl = URL(string: "https://mainnet.infura.io/"+apiKey) else {
            throw  NetworkError("Invalid url")
        }
        url = infuraUrl
    }
    
    func getSession() -> URLSession {
        return session
    }
    
    func getUrl() -> URL {
        return url
    }

    func getHeaders() -> Array<String> {
        fatalError("getHeaders() has not been implemented")
    }

}
