//
// Created by Timofey on 3/21/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Foundation
import Web3Swift

//Ethereum mainnet via infura service and a metamask api key
public final class MainnetInfuraMetamaskNetwork: Network {

    private let origin: Network = InfuraNetwork(chain: "mainnet", apiKey: "metamask")

    /**
    - returns:
    Id of a mainnet (should be 1)

    - throws:
    `DescribedError` if something went wrong
    */
    public func id() throws -> NumberScalar {
        return try origin.id()
    }

    /**
    - returns:
    `Data` for a JSON RPC call to mainnet

    - throws:
    `DescribedError` if something went wrong
    */
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try origin.call(
            method: method,
            params: params
        )
    }

}