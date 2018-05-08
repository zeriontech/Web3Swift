//
// Created by Timofey on 3/19/18.
//

import Foundation
import SwiftyJSON

//Procedure for fetching transaction
public final class TransactionProcedure: RemoteProcedure {

    private let network: Network
    private let transactionHash: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network to ask for transaction
        - transactionHash: hash of the raw transaction
    */
    public init(
        network: Network,
        transactionHash: BytesScalar
    ) {
        self.network = network
        self.transactionHash = transactionHash
    }

    /**
    - returns:
    `JSON` representation of the transaction

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_getTransactionByHash",
                params: [
                    BytesParameter(bytes: transactionHash)
                ]
            )
        )
    }

}
