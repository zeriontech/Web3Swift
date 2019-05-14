//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// FetchingLogsTests.swift
//
// Created by Vadim Koleoshkin on 14/05/2019
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

class FetchingLogsTests: XCTestCase {

    func testFetchLog() {
        expect {
            let receipt: JSON = try TransactionReceiptProcedure(
                network: MainnetAlchemyNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0x8790901230866dca461f30371f93bd538ab39535bb6c9a57fedbbbdea937ca1e"
                )
            ).call()
            
            print(receipt["result"]["logs"].arrayValue)
            
            let logs: [TransactionLog] = receipt["result"]["logs"].arrayValue.map {
                EthTransactionLog(serializedLog: $0)
            }
            
            try logs.forEach{ log in
                print(try log.topics()[0].value().toPrefixedHexString())
                print(try log.blockNumber().value().toDecimal())
                print(try log.address().value().toPrefixedHexString())
            }
            
            return logs
        }.notTo(
            throwError()
        )
    }
    
    func testFetchLogs2() {
        expect {
            let receipt = EthTransactionReceipt(
                network: MainnetAlchemyNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0x8790901230866dca461f30371f93bd538ab39535bb6c9a57fedbbbdea937ca1e"
                )
            )
            
            let logs = try receipt.logs().value()
            
            try logs.forEach{ log in
                print(try log.signature().value().toPrefixedHexString())
                print(try log.blockNumber().value().toDecimal())
                print(try log.address().value().toPrefixedHexString())
            }
            
            return logs
        }.notTo(
            throwError()
        )
    }

}
