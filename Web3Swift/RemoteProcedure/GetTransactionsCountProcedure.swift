//
// Created by Timofey on 1/20/18.
//

import Foundation
import SwiftyJSON

class GetTransactionsCountProcedure: RemoteProcedure {

    private var network: Network
    private var address: Address
    private var blockChainState: BlockChainState

    init(network: Network, address: Address, blockChainState: BlockChainState) {
        self.network = network
        self.address = address
        self.blockChainState = blockChainState
    }

    func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_getTransactionCount",
                params: [
                    AddressParameter(address: address),
                    TagParameter(state: blockChainState)
                ]
            )
        )
    }

}
