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
    
    private var infura: InfuraNetwork
    
    init() {
        infura = try! InfuraNetwork(chain: "mainnet", apiKey: "metamask") //swiftlint:disable:this force_try
    }
    
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try infura.call(method: method, params: params)
    }
    
}
