//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// HexTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class HexTests: XCTestCase {
    
    /// Hex should not throw any errors if correct hex was passed to it
    func testValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaF")
        }.notTo(
            throwError()
        )
        
    }
    
    /// Hex should not throw an error if incorrect hex was passed to it. 'R' character in this test
    func testInValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaR")
        }.to(
            throwError()
        )
        
    }
    
    /// Hex should return not prefixed string on convertation to string
    func testHexToString() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaf").toString()
        }.to(
            equal("deadbeaf")
        )
        
    }
    
    /// Hex should return prefixed string on convertation to string with prefix
    func testHexToPrefixString() {
        
        expect{
            try SimpleHex(value: "deadbeaf").toPrefixString()
        }.to(
            equal("0xdeadbeaf")
        )
        
    }
    
}
