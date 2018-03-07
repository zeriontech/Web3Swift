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
    
    /// Assert correct address does not throw an error
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
    
    /// Assert invalid address throws an error of type `InvalidAddressLengthError`
    func testInValidLengthAddress() {
        expect{
            try EthAddress(
                hex: "0x0000000000000000000000000000000000000000111"
            ).value()
        }.to(
            throwError(),
            description: "Make sure longer address throws an error"
        )
        
        expect{
            try EthAddress(
                hex: "0x000000000"
            ).value()
        }.to(
            throwError(),
            description: "Make sure shorter address throws an error"
        )

    }
    
    /// Assert address converts to right prefixed string
    func testAddressToString() {
        
        expect{
            try EthAddress(
                hex: "0x0000000000000000000000000000000000000000"
            ).value()
        }.to(
            equal(Data(bytes: Array<UInt8>(repeating: 0x00, count: 20))),
            description: "Make sure correct prefixed string is retuned"
        )
        
    }
    
}
