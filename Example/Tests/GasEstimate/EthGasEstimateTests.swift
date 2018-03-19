//
// Created by Timofey on 3/14/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class EthGasEstimateTests: XCTestCase {

    func testGasEstimateIsNonNegative() {
        let network = FakeEthereumNetwork()
        expect{
            try EthGasEstimate(
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
                weiAmount: BigEndianCompactNumber(
                    origin: BigEndianNumber(
                        uint: 100
                    )
                )
            ).uint()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Network gas estimate is expected to be non negative number"
        )
    }

}