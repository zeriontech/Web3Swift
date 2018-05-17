//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ComputedContractAddressTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ComputedContractAddressTests: XCTestCase {

    func testContractAddressesAreComputedCorrectly() {
        Array<
            (
                nonce: String,
                address: String
            )
        >(
            [
                (
                    nonce: "0x00",
                    address: "72f72a290a84804b8079b2bba7e4ddd00f9aae5f"
                ),
                (
                    nonce: "0x7f",
                    address: "8c61d6f129c36a012c2995c658fb2c83aeb66079"
                ),
                (
                    nonce: "0x80",
                    address: "e11257ee767583a1ea4cfcee9db066f31eccaffa"
                )
            ]
        ).forEach{ nonce, address in
            let owner = Tim()
            expect{
                try ComputedContractAddress(
                    ownerAddress: owner.address(),
                    transactionNonce: EthNaturalNumber(
                        hex: nonce
                    )
                ).value().toHexString()
            }.to(
                equal(
                    address
                ),
                description: "Contract address from \(owner.address()) at nonce \(nonce) is expected to be \(address)"
            )
        }
    }

}
