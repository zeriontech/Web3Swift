//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EstimateGasProcedureTests.swift
//
// Created by Timofey Solonin on 10/05/2018
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
                        number: EthNumber(
                            value: 100
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
