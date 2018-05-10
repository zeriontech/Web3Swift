//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// MainnetInfuraMetamaskNetworkTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class MainnetInfuraMetamaskNetworkTests: XCTestCase {

    func testMainnetID() {
        expect{
            try MainnetInfuraMetamaskNetwork().id().uint()
        }.to(
            equal(1),
            description: "Mainnet is expected to have an id of 1"
        )
    }

    func testMainnetCall() {
        expect{
            try JSON(
                data: MainnetInfuraMetamaskNetwork().call(
                    method: "net_version",
                    params: []
                )
            )["result"].string()
        }.to(
            equal("1"),
            description: "net_version call on the mainnet is expected to return decimal string representation of a decimal number"
        )
    }

}
