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
    
    func testSimpleContractCallIsEncodedCorrectly() {
        expect{
            try EthContractCallBytes(
                network: MainnetAlchemyNetwork(),
                senderKey: Alice().privateKey(),
                contractAddress: EthAddress(
                    hex: "0x6b175474e89094c44da98b954eedeac495271d0f"
                ),
                weiAmount: Zero(),
                functionCall: EncodedABIFunction(
                    signature: "approve(address,uint256)",
                    parameters: [
                        ABIAddress(
                            address: Bob().address()
                        ),
                        ABIUnsignedNumber(
                            origin: EthNumber(value: 1)
                        )
                    ]
                )
            ).value().toHexString()
        }.to(
            equal(
                "f8a80284bebc200082abd2946b175474e89094c44da98b954eedeac495271d0f80b844095ea7b3000000000000000000000000c1eb01819ae7dfbd99ee795953a0d67888866f35000000000000000000000000000000000000000000000000000000000000000125a0d80fee8f5b79148b041b0eaf6ed487674ee01e75ece536f80870e838aebcc626a06a37d1e32991846d5626f93c54fe59eb5c9adaba3856da742b07fd09c628cc58"
            ),
            description: "Contract call is expected to be encoded correctly"
        )
    }

}
