//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GethNetworkTests.swift
//
// Created by Vadim Koleoshkin on 23/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class GethNetworkTests: XCTestCase {
    
    /// Assert network initialisation with correct url
    func testValidUrl()
    {
        expect{
            try GethNetwork(url: "https://mainnet.infura.io/v3/0c4d6dc730244b4185a6bde26f981bff").id()
        }.notTo(
            throwError(),
            description: "Make sure network can be initialised with correct url"
        )
    }
    
    /// Assert network initialisation with correct url
    func testInValidUrl()
    {
        expect{
            try GethNetwork(url: "fdasdf@@fodksafjm($^^8fdsf").id()
        }.to(
            throwError(errorType: IncorrectUrlStringError.self),
            description: "Make sure network can not be initialised with correct url"
        )
    }

    func testGethNetworkThrowsRPCErrors() {
        expect{
            try GethNetwork(
                url: "http://127.0.0.1:8545"
            ).call(
                method: "eth_call",
                params: []
            )
        }.to(
            throwError(
                errorType: JSONError.self
            ),
            description: "Eth_call without parameters is expected to fail as a JSONError"
        )
    }
    
}
