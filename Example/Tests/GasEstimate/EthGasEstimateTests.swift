//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthGasEstimateTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class EthGasEstimateTests: XCTestCase {

    func testGasEstimateIsNonNegative() {
        let network = GanacheLocalNetwork()
        expect{
            try EthInteger(
                hex: EthGasEstimate(
                    network: network,
                    senderAddress: EthAddress(
                        hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                    ),
                    recipientAddress: EthAddress(
                        hex: "0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403"
                    ),
                    gasPrice: EthGasPrice(
                        network: network
                    ),
                    weiAmount: EthNumber(
                        value: 100
                    )
                )
            ).value()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Network gas estimate is expected to be non negative number"
        )
    }

}
