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

//Local test net
public final class GanacheLocalNetwork: Network {
    
    private let origin: Network

    /**
    Ctor
    */
    init() {
        origin = GethNetwork(url: "http://127.0.0.1:8545")
    }

    /**
    - returns:
    Id of a ganache network

    - throws:
    `DescribedError` if something went wrong
    */
    public func id() throws -> NumberScalar {
        return try origin.id()
    }

    /**
    - returns:
    `Data` from the testnet

    - throws:
    `DescribedError` if something went wrong
    */
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try origin.call(method: method, params: params)
    }
    
}
