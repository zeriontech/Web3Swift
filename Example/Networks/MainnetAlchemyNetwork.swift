//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// MainnetAlchemyNetwork.swift
//
// Created by Vadim Koleoshkin on 27/03/2019
//

import Foundation
import Web3Swift

// Ethereum mainnet via alchemyapi.io service and a Web3Swift.io api key
// This is a demo key provided by Alchemy for testing purposes only and has lower performance.
// Sign up for an official key at https://alchemyapi.io if you plan to use this in any development, staging, or production environments.
public final class MainnetAlchemyNetwork: Network {
    
    private let origin: Network = AlchemyNetwork(chain: "mainnet", apiKey: "ETi2ntZoWxd6nTI1qE13Q4I1eLB8AMDl")
    
    /**
     - returns:
     Id of a mainnet (should be 1)
     
     - throws:
     `DescribedError` if something went wrong
     */
    public func id() throws -> IntegerScalar {
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
