//
// Created by Timofey on 3/20/18.
//

import Foundation
import SwiftyJSON

//Procedure for fetching balance at the address
public final class BalanceProcedure: RemoteProcedure {

    private let network: Network
    private let address: BytesScalar
    private let state: BlockChainState

    /**
    Ctor

    - parameters:
        - network: network to ask for balance
        - address: address to ask the balance for
        - state: state at which the balance of the address is to be asked
    */
    public init(
        network: Network,
        address: BytesScalar,
        state: BlockChainState
    ) {
        self.network = network
        self.address = address
        self.state = state
    }

    /**
    - returns:
    `JSON` representation of the balance

    - throws:
    `DescribedError` if something went wrong
    */
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