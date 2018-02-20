//
// Created by Timofey on 1/27/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class EthTransactionsTests: XCTestCase {

    func testTransactionsCount() {
        expect{
            try EthTransactions(
                transactionsCountProcedure: GetTransactionsCountProcedure(
                    network: TestingEthereumNetwork(),
                    address: TestingAddress(),
                    blockChainState: PendingBlockChainState()
                )
            ).count()
        }.to(
            beGreaterThanOrEqualTo(0)
        )
    }

}
