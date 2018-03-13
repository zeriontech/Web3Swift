//
// Created by Timofey on 1/20/18.
//

import Foundation
import SwiftyJSON

public class GetTransactionsCountProcedure: RemoteProcedure {

    private var network: Network
    private var address: BytesScalar
    private var blockChainState: BlockChainState

    init(network: Network, address: BytesScalar, blockChainState: BlockChainState) {
        self.network = network
        self.address = address
        self.blockChainState = blockChainState
    }

    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_getTransactionCount",
                params: [
                    BytesParameter(
                        bytes: address
                    ),
                    TagParameter(state: blockChainState)
                ]
            )
        )
    }

}
