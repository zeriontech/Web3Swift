//
// Created by Timofey on 1/21/18.
//

import Foundation

//FIXME: Init should throw since URLRequest is actually HTTPURLRequest
class URLPostRequest {

    private let url: URL
    private let body: Data
    private let headers: Dictionary<String,String>
    init(url: URL, body: Data, headers: Dictionary<String,String>) {
        self.url = url
        self.body = body
        self.headers = headers
    }

    func toURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        headers.forEach {
            request.allHTTPHeaderFields($0.key, $0.value)
        }
        return request
    }

}
