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
    
    /// SimpleAddress should not throw any errors if correct length hex string was passed to it
    func testValidAddress() {

        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0x0000000000000000000000000000000000000000")
            )
        }.notTo(
            throwError()
        )

    }
    
    /// SimpleAddress should throw an error if longer/shorter length hex string was passed to it
    func testInValidLengthAddress() {

        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0x0000000000000000000000000000000000000000111")
            )
        }.to(
            throwError()
        )
        
        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0x000000000")
            )
        }.to(
                throwError()
        )

    }
    
    /// SimpleAddress should return correct prefixed hex string
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
