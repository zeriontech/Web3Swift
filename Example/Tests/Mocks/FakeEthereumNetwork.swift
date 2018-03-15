//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TestingEthereumNetwork.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Foundation
@testable import Web3Swift

public final class FakeEthereumNetwork: Network {
    
    private var origin: InfuraNetwork
    
    init() {
        origin = InfuraNetwork(chain: "mainnet", apiKey: "metamask")
    }

    public func id() throws -> NumberScalar {
        return try origin.id()
    }

    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try origin.call(method: method, params: params)
    }
    
}
