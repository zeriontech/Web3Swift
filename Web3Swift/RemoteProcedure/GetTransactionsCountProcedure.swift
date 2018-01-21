//
// Created by Timofey on 1/20/18.
//

import Foundation
import SwiftyJSON

class GetTransactionsCountProcedure: RemoteProcedure {

    private let session: URLSession
    private let address: Address
    private let networkURL: URL

    //TODO: Replace session and networkURL with a single object that can return Data by accepting method and parameters as dependency
    init(session: URLSession, networkURL: URL, address: Address) {
        self.session = session
        self.networkURL = networkURL
        self.address = address
    }

    func call() throws -> Data {
        return try session.data(
            from: URLPostRequest(
                url: networkURL,
                body: JSON(
                    dictionary: [
                        "jsonrpc" : "2.0",
                        "method" : "eth_getTransactionCount",
                        "params" : [address.toString(), "latest"],
                        "id" : 0
                    ]
                ).rawData()
            ).toURLRequest()
        )
    }

}
