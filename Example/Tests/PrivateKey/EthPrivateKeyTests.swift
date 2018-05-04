//
// Created by Timofey on 3/7/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthPrivateKeyTests: XCTestCase {

    func testValidPrivateKey() {
        expect{
            try EthPrivateKey(
                bytes: BytesFromHexString(
                    hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                )
            ).address().value()
        }.to(
            equal(
                Data(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e")
            )
        )
    }
    
    func testValidStringScalarPrivateKey() {
        expect{
            try EthPrivateKey(
                hex: SimpleString{
                    "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                }
                ).address().value()
        }.to(
            equal(
                Data(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e")
            )
        )
    }
    
    func testValidStringPrivateKey() {
        expect{
            try EthPrivateKey(
                hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                ).address().value()
        }.to(
            equal(
                Data(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e")
            )
        )
    }

}
