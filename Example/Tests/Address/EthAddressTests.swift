//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleAddressTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class EthAddressTests: XCTestCase {

    func testValidAddress() {
        expect{
            try EthAddress(
                hex: "0x0000000000000000000000000000000000000000"
            ).value()
        }.notTo(
            throwError(),
            description: "Make sure correct address does not throw an error"
        )
    }

    func testShortAddress() {
        expect{
            try EthAddress(
                hex: "0x0000000000"
            ).value()
        }.to(
            throwError(),
            description: "Make sure shorter address throws an error"
        )
    }

    func testLongAddress() {
        expect{
            try EthAddress(
                hex: "0x00000000000000000000000000000000000000001111"
            ).value()
        }.to(
            throwError(),
            description: "Make sure longer address throws an error"
        )
    }

    func testAmbiguousLength() {
        expect{
            try EthAddress(
                hex: "0xD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ).value()
        }.to(
            throwError(),
            description: "Ambiguous length address is expected to throw error"
        )
    }

    func testAddressToString() {
        expect{
            try EthAddress(
                hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ).value()
        }.to(
            equal(Data([0xcd, 0x8a, 0xC9, 0x0d, 0x9c, 0xc7, 0xe4, 0xc0, 0x34, 0x30, 0xd5, 0x8d, 0x2f, 0x3e, 0x87, 0xDa, 0xe7, 0x0b, 0x80, 0x7e])),
            description: "Make sure correct bytes representation is returned"
        )
    }

    func testAddressFromStringScalarIsValid() {
        expect{
            try PrefixedHexString(
                bytes: EthAddress(
                    hex: SimpleString(
                        string: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                    )
                )
            ).value()
        }.to(
            equal(
                "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e".lowercased()
            ),
            description: "Address is expected to persist"
        )
    }
    
}
