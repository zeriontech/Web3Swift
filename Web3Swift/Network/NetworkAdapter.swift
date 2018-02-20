import Foundation

public protocol NetworkAdapter {
    
    func getSession() -> URLSession
    
    func getUrl() -> URL

    func getHeaders() -> Dictionary<String, String>
    
}
