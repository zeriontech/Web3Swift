//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Keccak256BytesTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class Keccak256BytesTests: XCTestCase {

    func testDigestsCorrectly() {
        expect{
            try Keccak256Bytes(
                origin: ASCIIStringBytes(
                    string: SimpleString(
                        string: "baz(uint32,bool)"
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0992ec5bbfc459984220f8c45084cc24d9b6efed1fae540db8de801d2"
                )
            ),
            description: "Keccak256 is expected to digest correctly"
        )
    }

}
