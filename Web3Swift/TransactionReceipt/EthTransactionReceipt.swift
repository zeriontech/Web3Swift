//
// Created by Timofey on 3/19/18.
//

import Foundation

//Receipt returned by network for transaction
public final class EthTransactionReceipt: TransactionReceipt {

    private let procedure: RemoteProcedure

    /**
    Ctor

    - parameters:
        - network: network to work with
        - transactionHash: bytes representation of the transaction hash
    */
    public init(
        network: Network,
        transactionHash: BytesScalar
    ) {
        self.procedure = TransactionReceiptProcedure(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    Gas amount that was used up by the transaction

    - throws:
    `DescribedError if something went wrong`
    */
    public func usedGasAmount() throws -> NumberScalar {
        return try BigEndianCompactNumber(
            hex: procedure.call()["result"]["gasUsed"].string()
        )
    }

}