//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthBlockTests.swift
//
// Created by Vadim Koleoshkin on 18/08/2019
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class EthBlockTests: XCTestCase {

    func testBlockHash()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"
                ),
                network: MainnetAlchemyNetwork()
            ).block().hash().value().toPrefixedHexString()
        }.to(
            equal("0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"),
            description: "Expect block hash to have correct value"
        )
    }
    
    func testBlockNumber()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"
                ),
                network: MainnetAlchemyNetwork()
            ).block().number().value().toDecimalString()
        }.to(
            equal("8374147"),
            description: "Expect block number to have correct value"
        )
    }

    func testBlockTimestamp()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"
                ),
                network: MainnetAlchemyNetwork()
            ).block().timestamp().value().toDecimalString()
        }.to(
            equal("1566128500"),
            description: "Expect block timestamp to have correct value"
        )
    }
    
    func testBlockParentHash()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"
                ),
                network: MainnetAlchemyNetwork()
            ).block().parentHash().value().toPrefixedHexString()
        }.to(
            equal("0x4228a7923f72b8c4faf7dd25c0d102ee28ad2ca9435d223046964d98e183823f"),
            description: "Expect block parent hash to have correct value"
        )
    }
    
    func testBlockTransactions()
    {
        expect{
            try EthBlockHash(
                bytes: BytesFromHexString(
                    hex: "0x72946042d329c02d26af0a5fe7f5ec43a3e07cd243b444114f83d411376e929d"
                ),
                network: MainnetAlchemyNetwork()
            ).block().transactions().value().count
        }.to(
            equal(82),
            description: "Expect block trasactions count to have correct value"
        )
    }

}
