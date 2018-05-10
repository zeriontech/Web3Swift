//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABIAddressTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class DecodedABIAddressTests: XCTestCase {

    func testPlainAddressIsDecodedCorrectly() {
        expect{
            try DecodedABIAddress(
                abiMessage: ABIMessage(
                    message: "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1"
                ),
                index: 0
            ).value().toHexString()
        }.to(
            equal(
                "407d73d8a49eeb85d32cf465507dd71d507100c1"
            ),
            description: "ABI address is expected to persist"
        )
    }

    func testAddressAtSecondPositionIsDecodedCorrectly() {
        expect{
            try DecodedABIAddress(
                abiMessage: ABIMessage(
                    message: [
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "000000000000000000000000cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "0000000000000000000000000000000000000000000000000000000000000040",
                        "00000000000000000000000000000000000000000000000000000000000000a0",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "cc00000000000000000000000000000000000000000000000000000000000000",
                        "bb00000000000000000000000000000000000000000000000000000000000000",
                        "0000000000000000000000000000000000000000000000000000000000000002",
                        "aa00000000000000000000000000000000000000000000000000000000000000",
                        "ff00000000000000000000000000000000000000000000000000000000000000"
                    ].reduce("", +)
                ),
                index: 1
            ).value().toHexString()
        }.to(
            equal(
                "cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e"
            ),
            description: "ABI address at second position is expected to persist"
        )
    }

}
