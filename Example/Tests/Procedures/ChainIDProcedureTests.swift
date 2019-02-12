//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ChainIDProcedureTests.swift
//
// Created by Timofey Solonin on 2/1/18.
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class ChainIDProcedureTests: XCTestCase {
    
    // Assert network does not throw an error on network call
    func testNoThrow() {
        expect(
            try ChainIDProcedure(
                network: MainnetInfuraNetwork()
            ).call()
        ).toNot(
            throwError(),
            description: "Make sure nework call does not throw an error"
        )
    }
    
    /// Assert response contains right chain id
    func testMainNetID() {
        expect{
            try ChainIDProcedure(
                network: MainnetInfuraNetwork()
            ).call()["result"].string()
        }.to(
            equal(
                "1"
            ),
            description: "Make sure right chain id is returned"
        )
    }

}
