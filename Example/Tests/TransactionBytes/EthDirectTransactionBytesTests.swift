//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthDirectTransactionBytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthDirectTransactionBytesTests: XCTestCase {

    func testStaticParametersAreSignedCorrectly() {
        expect{
            try EthDirectTransactionBytes(
                network: GanacheLocalNetwork(),
                senderKey: EthPrivateKey(
                    bytes: BytesFromHexString(
                        hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                    )
                ),
                recipientAddress: EthAddress(
                     hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                ),
                weiAmount: EthNaturalNumber(
                    origin: EthNaturalNumber(
                        value: 100
                    )
                )
            ).value().toHexString()
        }.to(
            equal("f864808504a817c80082520894cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e648025a0e0144b1672b54d18f4351afe683c6a964b109b372a52e0dbcd5d850752842680a055eca66f24e633932f0f79ab81f5939c49932c5a979a2d4ab4710fe661f65059"),
            description: "Above transaction is expected to be signed correctly with dependencies described as in GanacheLocalNetworkTests"
        )
    }

}
