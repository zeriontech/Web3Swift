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

public final class TestingEthereumNetwork: Network {
    
    private var infura: InfuraNetwork
    
    init() throws {
        infura = try InfuraNetwork(chain: "mainnet", apiKey: "metamask")
    }
    
    public func call(method: String, params: Array<GethParameter>) throws -> Data {
        return try infura.call(method: method, params: params)
    }
    
}
