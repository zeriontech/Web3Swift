//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CompactHexStringTests.swift
//
// Created by Vadim Koleoshkin on 16/06/2018
//

import Nimble
import Quick
@testable import Web3Swift

class CompactHexStringTests: XCTestCase {
    
    func testCompactRepresentationFromStringScalar() {
        expect{
            try CompactHexString(
                hex: SimpleString{
                    "0x00Deadbeaf"
                }
            ).value()
        }.to(
            equal("deadbeaf"),
            description: "String is expected to be compactly represented"
        )
    }
    
    func testCompactRepresentationFromBytesScalar() {
        expect{
            try CompactHexString(
                bytes: BytesFromHexString(
                    hex: "0x00Deadbeaf"
                )
            ).value()
        }.to(
            equal("deadbeaf"),
            description: "String is expected to be compactly represented"
        )
    }
    
    func testUnChangedCompactRepresentation() {
        expect{
            try CompactHexString(
                hex: SimpleString{
                    "deadbeaf"
                }
            ).value()
        }.to(
            equal("deadbeaf"),
            description: "String is expected to be compactly represented"
        )
    }
    
    func testCompactRepresentationOfZero() {
        expect{
            try CompactHexString(
                hex: SimpleString{
                    "00000000"
                }
            ).value()
        }.to(
            equal("0"),
            description: "Zero shoud not be represented as an empty string"
        )
    }
    
}
