//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthContractCallTests.swift
//
// Created by Timofey Solonin on 25/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EthContractCallTests: XCTestCase {

    func testEOSSupply() {
        expect{
            try HexAsDecimalString(
                hex: EthContractCall(
                    network: MainnetInfuraNetwork(),
                    contractAddress: EthAddress(
                        hex: "0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0"
                    ),
                    functionCall: EncodedABIFunction(
                        signature: SimpleString(
                            string: "totalSupply()"
                        ),
                        parameters: []
                    )
                )
            ).value()
        }.to(
            equal(
                "1000000000000000000000000000"
            ),
            description: "EOS supply is expected to be 1,000,000,000,000,000,000,000,000,000 wad"
        )
    }
    
    func testWethDeposit() {
        expect{
            try HexAsDecimalString(
                hex: EthContractCall(
                    network: MainnetInfuraNetwork(),
                    senderAddress: EthAddress(
                        hex: "0x42b9df65b219b3dd36ff330a4dd8f327a6ada990"
                    ),
                    contractAddress: EthAddress(
                        hex: "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2"
                    ),
                    weiAmount: EthNumber(decimal: "1"),
                    functionCall: EncodedABIFunction(
                        signature: SimpleString(
                            string: "deposit()"
                        ),
                        parameters: []
                    )
                )
            ).value()
        }.to(
            equal(
                "0"
            ),
            description: "Paypable functions should be eligible for calling"
        )
    }

}
