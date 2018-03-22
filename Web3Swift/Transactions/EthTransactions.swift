//
// Created by Timofey on 1/27/18.
//

import Foundation
import SwiftyJSON

public final class EthTransactions: Transactions {

    private let procedure: RemoteProcedure
    init(network: Network, address: BytesScalar, blockChainState: BlockChainState) {
        self.procedure = GetTransactionsCountProcedure(
            network: network,
            address: address,
            blockChainState: blockChainState
        )
    }

    public func count() throws -> NumberScalar {
        let transactionsCountProcedure = self.procedure
        return BigEndianCompactNumber(
            hex: SimpleString{
                try transactionsCountProcedure.call()["result"].string()
            }
        )
    }

}