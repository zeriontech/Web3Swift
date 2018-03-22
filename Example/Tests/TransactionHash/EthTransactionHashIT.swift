//
// Created by Timofey on 3/20/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionHashIT: XCTestCase {

    func testExistingTransactionHashReceipt() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).receipt().usedGasAmount().uint()
        }.to(
            equal(21000),
            description: "This transaction from mainnet used up 21000 gas"
        )
    }

    func testExistingTransactionHashTransaction() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).transaction().nonce().uint()
        }.to(
            equal(5),
            description: "This transaction from mainnet had a nonce of 5"
        )
    }

    func testPersistsHashValue() {
        expect{
            try EthTransactionHash(
                network: MainnetInfuraMetamaskNetwork(),
                transactionHash: BytesFromHexString(
                    hex: "0xd84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"
                )
            ).value().toHexString()
        }.to(
            equal("d84b4a8661d546b3858d5b6fcf5a815e5efab48786deee67a4441d27b22e3011"),
            description: "Transaction hash constructed from the hash bytes is expected to persist"
        )
    }

}
