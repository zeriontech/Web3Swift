//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionIT.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionIT: XCTestCase {

    func testExistingTransactionNonce() {
        expect{
            try EthTransaction(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).nonce().value().toHexString()
        }.to(
            equal(
                "05"
            ),
            description: "This transaction from mainnet had a nonce of 5"
        )
    }

}

