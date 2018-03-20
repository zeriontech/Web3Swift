//
// Created by Timofey on 3/20/18.
//

import Foundation
import SwiftyJSON

public final class SendRawTransactionProcedure: RemoteProcedure {

    private let network: Network
    private let transactionBytes: BytesScalar

    init(
        network: Network,
        transactionBytes: BytesScalar
    ) {
        self.network = network
        self.transactionBytes = transactionBytes
    }

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