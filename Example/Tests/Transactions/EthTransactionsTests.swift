//
// Created by Timofey on 1/27/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class EthTransactionsTests: XCTestCase {
    
    /// Assert that transaction count returns positive number
    func testTransactionsCount() {
        expect{
            try EthTransactions(
                transactionsCountProcedure: GetTransactionsCountProcedure(
                    network: FakeEthereumNetwork(),
                    address: Alice().address(),
                    blockChainState: PendingBlockChainState()
                )
            ).count().uint()
        }.to(
            beGreaterThanOrEqualTo(0),
            description: "Make sure positive number is returned"
        )
    }

}
