//
// Created by Timofey on 3/19/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class TransactionReceiptProcedureTests: XCTestCase {

    func testNotEmptyReceipt() {
        expect{
            try TransactionReceiptProcedure(
                network: InfuraNetwork(chain: "mainnet", apiKey: "metamask"),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).call()["result"].type
        }.to(
            equal(.dictionary),
            description: "This transaction from etherscan is expected to not be empty"
        )
    }

}