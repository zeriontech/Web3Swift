//
// Created by Timofey on 3/20/18.
//

import Foundation
import SwiftyJSON

public final class BalanceProcedure: RemoteProcedure {

    private let network: Network
    private let address: BytesScalar
    private let state: BlockChainState

    public init(
        network: Network,
        address: BytesScalar,
        state: BlockChainState
    ) {
        self.network = network
        self.address = address
        self.state = state
    }

    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_getBalance",
                params: [
                    BytesParameter(bytes: address),
                    TagParameter(state: state)
                ]
            )
        )
    }

}