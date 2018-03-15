import Foundation
import SwiftyJSON

internal final class IncorrectUrlStringError: DescribedError {

    private let url: String

    init(url: String) {
        self.url = url
    }

    internal var description: String {
        return "Incorrect URL string \"\(self.url)\""
    }

}

internal final class InvalidIDResponseError: DescribedError {

    private let response: String
    init(response: String) {
        self.response = response
    }

    var description: String {
        return "net_version call was expected to return \"result\" as decimal in a string but it was \(response)"
    }

}


public class SimpleNetwork: Network {
    
    private let session: URLSession
    private let url: String
    private let headers: Dictionary<String, String>
    
    init(session: URLSession, url: String, headers: Dictionary<String, String>) {
        self.session = session
        self.url = url
        self.headers = headers
    }

    /**
    - returns:
    id of a network

    - throws:
    `DescribedError` if something went wrong.
    */
    public func id() throws -> NumberScalar {
        let result = try ChainIDProcedure(
            network: SimpleNetwork(
                session: self.session,
                url: self.url,
                headers: self.headers
            )
        ).call()["result"].string()
        guard let id = UInt(result) else {
            throw InvalidIDResponseError(
                response: result
            )
        }
        return BigEndianCompactNumber(
            origin: BigEndianNumber(
                uint: id
            )
        )
    }

    // "id" : 16180 - see https://en.wikipedia.org/wiki/Golden_ratio
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        guard let url = URL(string: url) else {
            throw IncorrectUrlStringError(
                url: self.url
            )
        }
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
                        "id" : 16180
                    ]
                ).rawData(),
                headers: headers
            ).toURLRequest()
        )
    }
    
}
