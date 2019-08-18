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
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).receipt()
        }.notTo(
            throwError(),
            description: "The receipt should be fetched from blockchain"
        )
    }

    func testExistingTransactionHashTransaction() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction()
        }.notTo(
            throwError(),
            description: "The transaction should be fetched from blockchain"
        )
    }

    func testPersistsHashValue() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).value().toHexString()
        }.to(
            equal("d84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"),
            description: "Transaction hash constructed from the hash bytes is expected to persist"
        )
    }

}
