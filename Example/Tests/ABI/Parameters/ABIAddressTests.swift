//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIAddressTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABIAddressTests: XCTestCase {

    func testAddressTailIsEmpty() {
        expect{
            try ABIAddress(
                address: EthAddress(
                    hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "ABIAddress is not expected to have tails"
        )
    }

    func testAddressHeadEncoding() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIAddress(
                    address: EthAddress(
                        hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(repeating: 0x00, count: 12) + Data(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e")
            ),
            description: "ABIAddress is expected to be encoded padded left with zeroes to 32 bytes length"
        )
    }

    func testNonAddressBytesThrow() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIAddress(
                    address: SimpleBytes(
                        bytes: Array<UInt8>(
                            repeating: 0x01,
                            count: 1
                        )
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            throwError(),
            description: "ABIAddress initialized with improper bytes representation of address is expected to throw"
        )
    }

}
