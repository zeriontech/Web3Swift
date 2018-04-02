//
// Created by Timofey on 3/19/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class GanacheLocalNetworkTests: XCTestCase {

    func testNetworkID() {
        expect{
            try GanacheLocalNetwork().id().uint()
        }.to(
            equal(1),
            description: "Ganache net ID is expected to be equal 1"
        )
    }

    func testGasPrice() {
        expect{
            try EthGasPrice(
                network: GanacheLocalNetwork()
            ).hex().value()
        }.to(
            equal(
                Data(
                    bytes: [0x04, 0xA8, 0x17, 0xC8, 0x00]
                )
            ),
            description: "Ganache gas price is expected to be equal 20_000_000_000"
        )
    }

    func testGasEstimate() {
        let network = GanacheLocalNetwork()
        expect{
            try EthGasEstimate(
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
                weiAmount: BigEndianCompactNumber(
                    origin: BigEndianNumber(
                        uint: 100
                    )
                )
            ).uint()
        }.to(
            equal(21000),
            description: "Ganache estimate for sending value without data is expected to be 21000"
        )
    }

}
