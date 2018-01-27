import Foundation

protocol NetworkAdapter {
    
    func getSession() -> URLSession
    
    func getUrl() -> URL

    func getHeaders() -> Array<String, String>
    
}
