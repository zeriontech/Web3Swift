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
                    network: SimpleNetwork(
                        session: URLSession.shared,
                        url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT"),
                        headers: [:]
                    ),
                    address: SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C"),
                    blockChainState: PendingBlockChainState()
                )
            ).count()
        }.to(
            beGreaterThanOrEqualTo(0)
        )
    }

}
