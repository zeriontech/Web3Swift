//
// Created by Timofey on 3/20/18.
//

import Foundation
import SwiftyJSON

//Procedure for sending transaction bytes
public final class SendRawTransactionProcedure: RemoteProcedure {

    private let network: Network
    private let transactionBytes: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network where to deploy transaction
        - transactionBytes: bytes of the transaction to be deployed
    */
    init(
        network: Network,
        transactionBytes: BytesScalar
    ) {
        self.network = network
        self.transactionBytes = transactionBytes
    }

    /**
    - returns:
    bytes representation of the `TransactionHash`

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_sendRawTransaction",
                params: [
                    BytesParameter(bytes: transactionBytes)
                ]
            )
        )
    }

}