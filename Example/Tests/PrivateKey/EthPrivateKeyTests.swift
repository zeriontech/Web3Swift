//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthPrivateKeyTests.swift
//
// Created by Timofey Solonin on 10/05/2018
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
            ),
            description: "Private key from bytes should compute correct public address"
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
            ),
            description: "Private key from hex string should compute correct public address"
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
            ),
            description: "Private key from hex should compute correct public address"
        )
    }
    
    func testInValidStringPrivateKey() {
        expect{
            try EthPrivateKey(
                hex: "0xfake1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
            ).value()
        }.to(
            throwError(),
            description: "Invalid private key should throw an error"
        )
    }

}
