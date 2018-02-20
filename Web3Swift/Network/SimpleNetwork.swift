import Foundation
import SwiftyJSON

class SimpleNetwork: Network {
    
    private var session: URLSession
    private var url: URL
    private var headers: Dictionary<String, String>
    
    init(session: URLSession, url: URL, headers: Dictionary<String, String>) {
        self.session = session
        self.url = url
        self.headers = headers
    }
    
    func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try session.data(
            from: URLPostRequest(
                url: url,
                body: JSON(
                    dictionary: [
                        "jsonrpc" : "2.0",
                        "method" : method,
                        "params" : params.map {
                            try $0.value()
                        },
                        "id" : 1
                    ]
                    ).rawData(),
                    headers: headers
                ).toURLRequest()
        )
    }
    
}
