//
// Created by Timofey on 1/21/18.
//

import Foundation

//FIXME: Init should throw since URLRequest is actually HTTPURLRequest
class URLPostRequest {

    private let url: URL
    private let body: Data
    init(url: URL, body: Data) {
        self.url = url
        self.body = body
    }

    func toURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        return request
    }

}
