//
// Created by Timofey on 1/20/18.
//

import Foundation

class GetTransactionsCountProcedure: RemoteProcedure {

    private var network: Network
    private var address: Address
    private var blockChainState: BlockChainState

    init(network: Network, address: Address, blockChainState: BlockChainState) {
        self.network = network
        self.address = address
        self.blockChainState = blockChainState
    }

    func call() throws -> Data {

        return try network.call(
                method: "eth_getTransactionCount",
                params: [
                    AddressParameter(address: address),
                    TagParameter(state: blockChainState)
                ]
        )
    }

}
