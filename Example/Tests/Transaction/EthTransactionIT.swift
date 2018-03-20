//
// Created by Timofey on 3/20/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionIT: XCTestCase {

    func testExistingTransactionNonce() {
        expect{
            try EthTransaction(
                network: InfuraNetwork(chain: "mainnet", apiKey: "metamask"),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).nonce().uint()
        }.to(
            equal(5),
            description: "This transaction from mainnet had a nonce of 5"
        )
    }

}

