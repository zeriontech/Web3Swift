//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionReceiptIT.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionReceiptIT: XCTestCase {

    let transactionHash = EthTransactionHash(
        transactionHash: BytesFromHexString(
            hex: "0xfbaad83ca594fa30902586f06c9a2fd4d3855f3769e4cf3157eb0013abd0661f"
        )
    )
    
    let network = MainnetAlchemyNetwork()
    
    func testExistingTransactionReceiptCumulativeGasUsed() {
        expect{
            try self.transactionHash.receipt(
                network: self.network
            ).cumulativeUsedGasAmount().value().toDecimalString()
        }.to(
            equal(
                "4613437"
            ),
            description: "This transaction from mainnet cumulatively used up 4613437 gas"
        )
    }
    
    func testExistingTransactionReceiptGasUsed() {
        expect{
            try self.transactionHash.receipt(
                network: self.network
            ).usedGasAmount().value().toDecimalString()
        }.to(
            equal(
                "52362"
            ),
            description: "This transaction from mainnet used up 52362 gas"
        )
    }
    
    func testExistingTransactionReceiptBlockHash() {
        expect{
            try self.transactionHash.receipt(
                network: self.network
            ).blockHash().value().toPrefixedHexString()
        }.to(
            equal(
                "0xc63e76e7df16dfcde6b80db2764ac714a35cf9ee04e67a69c71d255c457b35b4"
            ),
            description: "This transaction from mainnet block hash 0xc63e76e7df16dfcde6b80db2764ac714a35cf9ee04e67a69c71d255c457b35b4"
        )
    }
    
    func testExistingTransactionReceiptLog() {
        expect{
            try self.transactionHash.receipt(
                network: self.network
            ).logs().value().count
        }.to(
            equal(
                1
            ),
            description: "This transaction from mainnet logs count 1"
        )
    }
    

}
