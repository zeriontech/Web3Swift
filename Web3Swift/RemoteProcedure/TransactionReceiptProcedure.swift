//
// Created by Timofey on 3/19/18.
//

import Foundation
import SwiftyJSON

//Procedure for retrieving transaction receipt
public final class TransactionReceiptProcedure: RemoteProcedure {

    private let transactionHash: BytesScalar
    private let network: Network

    /**
    Ctor

    - parameters:
        - network: network to ask for receipt
        - id: id of a receipt
    */
    public init(network: Network, transactionHash: BytesScalar) {
        self.network = network
        self.transactionHash = transactionHash
    }

    /**
    - returns:
    `JSON` for the transaction receipt

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_getTransactionReceipt",
                params: [
                    BytesParameter(bytes: transactionHash)
                ]
            )
        )
    }

}
