//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthToWeiTests.swift
//
// Created by Timofey Solonin on 08/06/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EthToWeiTests: XCTestCase {

    func testEthToWeiIsConvertedCorrectly() {
        expect{
            try HexAsDecimalString(
                hex: EthToWei(
                    amount: 1
                )
            ).value()
        }.to(
            equal("1000000000000000000"),
            description: "1 ether is expected to be equal to 1000000000000000000 wei"
        )
    }

}