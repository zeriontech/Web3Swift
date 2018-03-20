//
// Created by Timofey on 3/19/18.
//

import Foundation

//A transaction from the blockchain
public final class EthTransaction: Transaction {

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
        procedure = TransactionProcedure(
            network: network,
            transactionHash: transactionHash
        )
    }

    /**
    - returns:
    Number of transactions deployed by sender before this one

    - throws:
    `DescribedError` if something went wrong
    */
    public func nonce() throws -> NumberScalar {
        return try BigEndianCompactNumber(
            hex: procedure.call()["result"]["nonce"].string()
        )
    }

}