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
                    network: MainnetInfuraMetamaskNetwork(),
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

}