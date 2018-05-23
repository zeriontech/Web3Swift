//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GetGasPriceProcedureTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetGasPriceProcedureTests: XCTestCase {
    
    /// Assert network call returns non empty data
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: MainnetInfuraMetamaskNetwork()
                ).call()
        }.toNot(
            beEmpty()
        )
    }
    
    /// Assert gas price should be number (in hex format) that is greater than 0
    func testValueGreaterThanZero() {
        expect{
            try EthInteger(
                hex: GetGasPriceProcedure(
                    network: MainnetInfuraMetamaskNetwork()
                ).call()["result"].string()
            ).value()
        }.to(
            beGreaterThan(0),
            description: "Make sure positive gas price is returned"
        )
    }
    
}


