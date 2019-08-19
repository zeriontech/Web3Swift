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
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().nonce().value().toHexString()
        }.to(
            equal(
                "05"
            ),
            description: "This transaction from mainnet had a nonce of 5"
        )
    }
    
    func testExistingTransactionBlockHash() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().blockHash().value().toPrefixedHexString()
        }.to(
            equal(
                "0x18f0c46affb8d5636b6bc1e1774bccd741f95e7ececafd234b8d76d3e40183c6"
            ),
            description: "This transaction from mainnet had a block hash of 0x18f0c46affb8d5636b6bc1e1774bccd741f95e7ececafd234b8d76d3e40183c6"
        )
    }
    
    func testExistingTransactionSender() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().from().value().toPrefixedHexString()
        }.to(
            equal(
                "0xbb5109879678d02e020c3ec92b29ee97adbd83e7"
            ),
            description: "This transaction from mainnet had a sender of 0xbb5109879678d02e020c3ec92b29ee97adbd83e7"
        )
    }
    
    func testExistingTransactionReceiver() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().to().value().toPrefixedHexString()
        }.to(
            equal(
                "0xf5bec430576ff1b82e44ddb5a1c93f6f9d0884f3"
            ),
            description: "This transaction from mainnet had a receiver of 0xf5bec430576ff1b82e44ddb5a1c93f6f9d0884f3"
        )
    }
    
    func testExistingTransactionGas() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().gas().value().toDecimalString()
        }.to(
            equal(
                "166666"
            ),
            description: "This transaction from mainnet had a gas of 166666"
        )
    }
    
    func testExistingTransactionGasPrice() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().gasPrice().value().toDecimalString()
        }.to(
            equal(
                "50000000000"
            ),
            description: "This transaction from mainnet had a gas price of 50 Gwei"
        )
    }
    
    func testExistingTransactionHash() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().hash().value().toPrefixedHexString()
        }.to(
            equal(
                "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
            ),
            description: "This transaction from mainnet had a hash of 0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
        )
    }
    
    func testExistingTransactionValue() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().value().value().toDecimalString()
        }.to(
            equal(
                "489370000000000000"
            ),
            description: "This transaction from mainnet had a value of 0.48937 ETH"
        )
    }
    
    func testExistingTransactionInput() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                ),
                network: MainnetAlchemyNetwork()
            ).transaction().input().value().toHexString()
        }.to(
            equal(
               ""
            ),
            description: "This transaction from mainnet had a input of 0x00"
        )
    }

}

