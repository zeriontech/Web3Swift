//
// Created by Timofey on 3/21/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
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