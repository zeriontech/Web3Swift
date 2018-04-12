//
// Created by Timofey on 3/14/18.
//

import Foundation
import SwiftyJSON

public final class EstimateGasProcedure: RemoteProcedure {

    private let network: Network
    private let parameters: [String: EthParameter]

    /**
    Ctor

    - parameters:
        - network: network to call
        - parameters: arguments of the estimate
    */
    public init(
        network: Network,
        parameters: [String: EthParameter]
    ) {
        self.network = network
        self.parameters = parameters
    }


    /**
    - returns:
    `JSON` for the gas estimate

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_estimateGas",
                params: [
                    ObjectParameter(
                        dictionary: parameters
                    )
                ]
            )
        )
    }

}