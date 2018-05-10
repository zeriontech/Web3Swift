//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthGasPriceTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EthGasPriceTests: XCTestCase {

    func testNonNegativeGasPrice() {
        expect{
            try EthGasPrice(
                network: GanacheLocalNetwork()
            ).uint()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Value of an gas price reported by network is expected to be non negative"
        )
    }

}
