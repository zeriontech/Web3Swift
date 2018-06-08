//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// PrivateKeyAddressTests.swift
//
// Created by Timofey Solonin on 12/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class PrivateKeyAddressTests: XCTestCase {

    func testACorrectAddressIsReceivedFromPrivateKey() {
        expect{
            try PrefixedHexString(
                bytes: PrivateKeyAddress(
                    key: EthPrivateKey(
                        bytes: BytesFromHexString(
                            hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                        )
                    )
                )
            ).value()
        }.to(
            equal(
                "0xcd8ac90d9cc7e4c03430d58d2f3e87dae70b807e"
            ),
            description: "Private key address is expected to persist"
        )
    }

}