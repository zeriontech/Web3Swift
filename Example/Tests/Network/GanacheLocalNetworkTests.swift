//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GanacheLocalNetworkTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class GanacheLocalNetworkTests: XCTestCase {

    func testNetworkID() {
        expect{
            try GanacheLocalNetwork().id().value()
        }.to(
            equal(1),
            description: "Ganache net ID is expected to be equal 1"
        )
    }

    func testGasPrice() {
        expect{
            try EthGasPrice(
                network: GanacheLocalNetwork()
            ).value()
        }.to(
            equal(
                Data(
                    [0x04, 0xA8, 0x17, 0xC8, 0x00]
                )
            ),
            description: "Ganache gas price is expected to be equal 20_000_000_000"
        )
    }

    func testGasEstimate() {
        let network = GanacheLocalNetwork()
        expect{
            try EthInteger(
                hex: EthGasEstimate(
                    network: network,
                    senderAddress: BytesFromHexString(
                        hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                    ),
                    recipientAddress: BytesFromHexString(
                        hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
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
            equal(21000),
            description: "Ganache estimate for sending value without data is expected to be 21000"
        )
    }

}
