//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthTransactionLogTests.swift
//
// Created by Vadim Koleoshkin on 24/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class EthTransactionLogTests: XCTestCase {
    
    func testLogFetching() {
        expect{
            try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xfbaad83ca594fa30902586f06c9a2fd4d3855f3769e4cf3157eb0013abd0661f"
                ),
                network: MainnetAlchemyNetwork()
            ).receipt().logs().value()[0]
        }.notTo(
            throwError(),
            description: "Expect log to be obtained"
        )
    }
    
    func testLogFetchingFields() {
        expect{
            let log = try EthTransactionHash(
                transactionHash: BytesFromHexString(
                    hex: "0xfbaad83ca594fa30902586f06c9a2fd4d3855f3769e4cf3157eb0013abd0661f"
                ),
                network: MainnetAlchemyNetwork()
            ).receipt().logs().value()[0]
            
            expect{
                try log.address().value().toPrefixedHexString()
            }.to(
                equal("0x89d24a6b4ccb1b6faa2625fe562bdd9a23260359"),
                description: "Expect log address to be equal DAI address"
            )
            
            expect{
                try log.topics().reduce("", { concatedTopics, topic in
                    return concatedTopics + (try topic.value().toHexString())
                })
            }.to(                equal("ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef0000000000000000000000000849f0eb50a758dc837e9013b3c18610e9530089000000000000000000000000c1852f917835a9f2f97112672bc5c8afd1f21dc3"),
                description: "Expect log topics to be correct"
            )
            
            expect{
                try log.data().value().reduce("", { concatedTopics, data in
                    return concatedTopics + (try data.value().toHexString())
                })
            }.to(
                equal("00000000000000000000000000000000000000000000d3c21bcecceda1000000"),
                    description: "Expect log data to be correct"
            )
            
            expect{
                try log.signature().value().toHexString()
            }.to(
                equal("ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"),
                    description: "Expect log signature to be correct"
            )
            
            expect{
                try log.blockHash().value().toHexString()
            }.to(
                equal("c63e76e7df16dfcde6b80db2764ac714a35cf9ee04e67a69c71d255c457b35b4"),
                    description: "Expect log block hash to be correct"
            )
            
            expect{
                try log.blockNumber().value().toDecimalString()
            }.to(
                    equal("7823234"),
                    description: "Expect log block number to be correct"
            )
            
            expect{
                try log.index().value().toDecimalString()
            }.to(
                equal("0"),
                description: "Expect log index to be correct"
            )
            
            expect{
                try log.transactionIndex().value().toDecimalString()
            }.to(
                equal("62"),
                description: "Expect log transaction index to be correct"
            )
            
            expect{
                try log.transactionHash().value().toPrefixedHexString()
            }.to(
                equal("0xfbaad83ca594fa30902586f06c9a2fd4d3855f3769e4cf3157eb0013abd0661f"),
                description: "Expect log transaction hash to be correct"
            )
            
            expect{
                try log.removed().value()
            }.to(
                equal(false),
                description: "Expect log removed flag to be correct"
            )
            
            return log
        }.notTo(
            throwError(),
            description: "Expect log to be obtained"
        )
    }
    
    
    
}
