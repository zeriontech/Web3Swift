//
// Created by Timofey on 3/14/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class EstimateGasProcedureTests: XCTestCase {

    func testCorrectlyAssembledProcedureDoesntFail() {
        let network = GanacheLocalNetwork()
        expect{
            try EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: BytesFromHexString(
                            hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                        )
                    ),
                    "to" : BytesParameter(
                        bytes: BytesFromHexString(
                            hex: "0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403"
                        )
                    ),
                    "gasPrice" : QuantityParameter(
                        number: EthGasPrice(
                            network: network
                        )
                    ),
                    "value" : QuantityParameter(
                        number: BigEndianCompactNumber(
                            origin: BigEndianNumber(
                                uint: 100
                            )
                        )
                    )
                ]
            ).call()["result"].string()
        }.toNot(
            throwError(),
            description: "Calling EstimateGasProcedure with correct parameters is expected to return some \"result\""
        )
    }

}
