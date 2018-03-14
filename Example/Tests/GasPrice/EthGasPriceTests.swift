//
// Created by Timofey on 3/14/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class EthGasPriceTests: XCTestCase {

    func testNonNegativeGasPrice() {
        expect{
            try EthGasPrice(
                network: FakeEthereumNetwork()
            ).uint()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Value of an gas price reported by network is expected to be non negative"
        )
    }

}
