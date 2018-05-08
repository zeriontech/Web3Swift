//
//  ChainIDProcedure.swift
//  CryptoSwift
//
//  Created by Timofey on 2/1/18.
//

import Foundation
import SwiftyJSON

//Identifier of the network
public final class ChainIDProcedure: RemoteProcedure {

    private let network: Network

    /**
    Ctor

    - parameters:
        - network: network to ask for identifier
    */
    public init(network: Network) {
        self.network = network
    }

    /**
    - returns:
    `JSON` representation of the network id

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "net_version",
                params: []
            )
        )
    }

}
