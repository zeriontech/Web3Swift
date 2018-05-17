//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthAutoAccountIT.swift
//
// Created by Timofey Solonin on 10/05/2018
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
            try NaturalInteger(
                hex: recipient.balance()
            ).value()
        }.to(
            equal(0),
            description: "Recipient address is expected to be empty at the start"
        )
        expect{
            try sender.send(
                weiAmount: EthNaturalNumber(
                    origin: EthNaturalNumber(
                        value: 100
                    )
                ),
                to: recipientKey.address()
            )
        }.toNot(
            throwError(),
            description: "Transaction sending is not expected to throw"
        )
        expect{
            try NaturalInteger(
                hex: recipient.balance()
            ).value()
        }.to(
            equal(100),
            description: "Recipient address is expected to be topped up to 100 wei"
        )
    }

}
