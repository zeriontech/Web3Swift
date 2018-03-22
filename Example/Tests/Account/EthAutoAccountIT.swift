//
// Created by Timofey on 3/20/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class EthAutoAccountIT: XCTestCase {

    //TODO: Right now there is no way to perform mathematical operations and comparison with NumberScalar. Once it will be implemented this test should be refactored to prevent extraneous assumptions.
    func testValueIsSent() {
        let sender = EthAutoAccount(
            network: GanacheLocalNetwork(),
            privateKey: EthPrivateKey(
                bytes: BytesFromHexString(
                    hex: "0x159b7c413354adec1bd31caaf7e4fde71e9132a5b29193d2f6181de777745493"
                )
            )
        )
        let recipientKey = EthPrivateKey(
            bytes: BytesFromHexString(
                hex: "0xee963231891a9b0f5482ec129aacb65a1ab07af40e9e2284a260bc096d09df2d"
            )
        )
        let recipient = EthAutoAccount(
            network: GanacheLocalNetwork(),
            privateKey: recipientKey
        )
        expect{
            try recipient.balance().uint()
        }.to(
            equal(0),
            description: "Recipient address is expected to be empty at the start"
        )
        expect{
            try sender.send(
                weiAmount: BigEndianCompactNumber(
                    origin: BigEndianNumber(
                        uint: 100
                    )
                ),
                to: recipientKey.address()
            )
        }.toNot(
            throwError(),
            description: "Transaction sending is not expected to throw"
        )
        expect{
            try recipient.balance().uint()
        }.to(
            equal(100),
            description: "Recipient address is expected to be topped up to 100 wei"
        )
    }

}