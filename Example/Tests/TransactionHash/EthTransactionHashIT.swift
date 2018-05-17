//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionHashIT.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionHashIT: XCTestCase {

    func testExistingTransactionHashReceipt() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).receipt().usedGasAmount().value().toHexString()
        }.to(
            equal(
                "5208"
            ),
            description: "This transaction from mainnet used up 21000 gas"
        )
    }

    func testExistingTransactionHashTransaction() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).transaction().nonce().value().toHexString()
        }.to(
            equal(
                "05"
            ),
            description: "This transaction from mainnet had a nonce of 5"
        )
    }

    func testPersistsHashValue() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).value().toHexString()
        }.to(
            equal("d84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"),
            description: "Transaction hash constructed from the hash bytes is expected to persist"
        )
    }

}
