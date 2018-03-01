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
    
    /// Assert Hex does not throw an error on incorrect hex string
    func testValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaF")
        }.notTo(
            throwError(),
            description: "Make sure correct hex does not throw an error"
        )
        
    }
    
    /// Assert Hex throws an error on incorrect hex string 'R' character in this test
    func testInValidHex() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaR")
        }.to(
            throwError(),
            description: "Make sure incorrect hex throws an error"
        )
        
    }
    
    /// Assert that Hex returns non prefixed string
    func testHexToString() {
        
        expect{
            try SimpleHex(value: "0xdeadbeaf").toString()
        }.to(
            equal("deadbeaf"),
            description: "Make sure correct non prefixed string is returned"
        )
        
    }
    
    /// Assert that Hex returns prefixed string
    func testHexToPrefixString() {
        
        expect{
            try SimpleHex(value: "deadbeaf").toPrefixString()
        }.to(
            equal("0xdeadbeaf"),
            description: "Make sure correct prefixed string is returned"
        )
        
    }

    func testCorrectlyAlignedHexFor1() {
        expect{
            let hex = try SimpleHex(bigEndianCompactValue: "0x1")
            expect{
                hex.toBytes()
            }.to(
                equal(Data(bytes: [0x01])),
                description: "Hex data is expected to match its representative Data"
            )
            expect{
                hex.toString()
            }.to(
                equal("01"),
                description: "Hex string is expected to be unambiguously aligned and unprefixed string it represents"
            )
            expect{
                hex.toPrefixString()
            }.to(
                equal("0x01"),
                description: "Hex string is expected to be unambiguously aligned and prefixed string it represents"
            )
            return ()
        }.toNot(
            throwError(),
            description: "Above statements are not expected to throw"
        )
    }

    func testCorrectlyAlignedHexFor1023() {
        expect{
            let hex = try SimpleHex(bigEndianCompactValue: "0x3ff")
            expect{
                hex.toBytes()
            }.to(
                equal(Data(bytes: [0x03, 0xff])),
                description: "Hex data is expected to match its representative Data"
            )
            expect{
                hex.toString()
            }.to(
                equal("03ff"),
                description: "Hex string is expected to be unambiguously aligned and unprefixed string it represents"
            )
            expect{
                hex.toPrefixString()
            }.to(
                equal("0x03ff"),
                description: "Hex string is expected to be unambiguously aligned and prefixed string it represents"
            )
            return ()
        }.toNot(
            throwError(),
            description: "Above statements are not expected to throw"
        )
    }

    func testCorrectlyAlignedFor16() {
        expect{
            let hex = try SimpleHex(bigEndianCompactValue: "0xff")
            expect{
                hex.toBytes()
            }.to(
                equal(Data(bytes: [0xff])),
                description: "Hex data is expected to match its representative Data"
            )
            expect{
                hex.toString()
            }.to(
                equal("ff"),
                description: "Hex string is expected to be unambiguously aligned and unprefixed string it represents"
            )
            expect{
                hex.toPrefixString()
            }.to(
                equal("0xff"),
                description: "Hex string is expected to be unambiguously aligned and prefixed string it represents"
            )
            return ()
        }.toNot(
            throwError(),
            description: "Above statements are not expected to throw"
        )
    }
    
}
