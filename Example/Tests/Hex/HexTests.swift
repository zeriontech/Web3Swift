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
    
    func testValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaF")
        }.notTo(
            throwError()
        )
        
    }
    
    func testInValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaR")
        }.to(
            throwError()
        )
        
    }
    
    func testHexToString() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaf").toString()
        }.to(
            equal("deadbeaf")
        )
        
    }
    
    func testHexToPrefixString() {
        
        expect{
            try SimpleHex(value: "deadbeaf").toPrefixString()
        }.to(
            equal("0xdeadbeaf")
        )
        
    }
    
}
