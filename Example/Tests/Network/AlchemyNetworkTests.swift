//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// AlchemyNetworkTests.swift
//
// Created by Vadim Koleoshkin on 27/03/2019
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class AlchemyNetworkTests: XCTestCase {

    /// Assert network call does not throw an error on valid params
    func testValidCall() {
        expect{
            try MainnetAlchemyNetwork().call(
                method: "eth_getBalance",
                params: [
                    BytesParameter(
                        bytes: Alice().address()
                    )
                ]
            )
        }.notTo(
            throwError(),
            description: "Make sure network call executed succesfully"
        )
        
    }
    
    func testValidID() {
        expect{
            try MainnetAlchemyNetwork().id().value()
        }.to(
            equal(1),
            description: "Network Mainnet is expected to have id 1"
        )
    }
    
    func testEthereumBalanceCheck() {
        expect{
            try EthInteger(
                hex: try BalanceProcedure(
                    network: MainnetAlchemyNetwork(),
                    address: Alice().address(),
                    state: LatestBlockChainState()
                ).call()["result"].string()
            ).value()
        }.to(
            equal(0),
            description: "Alice balance is expected to be equal 0"
        )
    }

}
