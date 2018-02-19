//
// Created by Timofey on 1/27/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Web3Swift

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
