//
// Created by Timofey on 3/19/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class EthTransactionBytesIT: XCTestCase {

    func testStaticParametersAreSignedCorrectly() {
        expect{
            try EthTransactionBytes(
                network: GanacheLocalNetwork(),
                senderKey: EthPrivateKey(
                    bytes: BytesFromHexString(
                        hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
                    )
                ),
                recipientAddress: EthAddress(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"),
                weiAmount: BigEndianCompactNumber(
                    origin: BigEndianNumber(
                        uint: 100
                    )
                )
            ).value().toHexString()
        }.to(
            equal("f864808504a817c80082520894cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e648025a0e0144b1672b54d18f4351afe683c6a964b109b372a52e0dbcd5d850752842680a055eca66f24e633932f0f79ab81f5939c49932c5a979a2d4ab4710fe661f65059"),
            description: "Above transaction is expected to be signed correctly with dependencies described as in GanacheLocalNetworkTests"
        )
    }

}