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

final class SimpleAddressTests: XCTestCase {
    
    func testValidAddress() {

        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0x0000000000000000000000000000000000000000")
            )
        }.notTo(
            throwError()
        )

    }

    func testInValidLengthAddress() {

        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0x0000000000000000000000000000000000000000111")
            )
        }.to(
            throwError()
        )

    }
    
    func testAddressToString() {
        
        expect{
            try SimpleAddress(
                    hex: SimpleHex(value: "0x0000000000000000000000000000000000000000")
                ).toString()
        }.to(
            equal("0x0000000000000000000000000000000000000000")
        )
        
    }
    
    //TODO: Implement toData test
    
}
