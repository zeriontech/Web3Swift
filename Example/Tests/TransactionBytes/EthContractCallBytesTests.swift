//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthContractCallBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthContractCallBytesTests: XCTestCase {

    func testContractCallIsEncodedCorrectly() {
        expect{
            try EthContractCallBytes(
                networkID: SimpleInteger(
                    integer: 0x2a
                ),
                transactionsCount: EthNumber(
                    hex: "06"
                ),
                gasPrice: EthNumber(
                    hex: "0x04A817C800"
                ),
                gasEstimate: EthNumber(
                    hex: "0x0F4240"
                ),
                senderKey: Alice().privateKey(),
                contractAddress: EthAddress(
                    hex: "0x35fb3afcba318f339b1531556bfa14f0ff21df3a"
                ),
                weiAmount: EthNumber(
                    hex: "0x00"
                ),
                functionCall: EncodedABIFunction(
                    signature: SimpleString(
                        string: "number(uint256)"
                    ),
                    parameters: [
                        ABIUnsignedNumber(
                            origin: EthNumber(
                                hex: "0x04A817C800"
                            )
                        )
                    ]
                )
            ).value().toHexString()
        }.to(
            equal(
                "f889068504a817c800830f42409435fb3afcba318f339b1531556bfa14f0ff21df3a80a4431aabc200000000000000000000000000000000000000000000000000000004a817c80077a06f63227e2f509cf2adc00e258410ae9ec58b394a06a0a5233dec79895cea32f1a052b097369a170ba1fd203fbe015694b1a0c3d5d1c84dd6dc2278073dc1997aa7"
            ),
            description: "Contract call is expected to be encoded correctly"
        )
    }

}
