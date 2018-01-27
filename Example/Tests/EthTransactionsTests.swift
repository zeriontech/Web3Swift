//
// Created by Timofey on 1/27/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Web3Swift

final class EthTransactionsTests: XCTestCase {

    func testTransactionsCount() {
        let count = try? EthTransactions(
            transactionsCountProcedure: GetTransactionsCountProcedure(
                session: URLSession.shared,
                networkURL: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                address: SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C")
            )
        ).count()

        XCTAssertNotNil(count)
        XCTAssert(count! >= 0)
    }

}
