//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// AddressParameterTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class BytesParameterTests: XCTestCase {
    
    /// Assert that parameter returns correct string
    func testAddressParameterToString() {
        expect{
            try BytesParameter(
                bytes: Alice().address()
            ).value() as? String
        }.to(
            equal(
                Alice().rawAddress().lowercased()
            ),
            description: "Make sure same prefixed hex string is returned"
        )
    }
    
    /// Assert that parameter returns correct string
    func testOtherAddressParameterToString() {
        expect{
            try BytesParameter(
                bytes: Bob().address()
            ).value() as? String
        }.to(
            equal(
                Bob().rawAddress().lowercased()
            ),
            description: "Make sure same prefixed hex string is returned"
        )
    }
    
    /// Assert that parameter returns correct string
    func testIncorrectAddressParameterToString() {
        expect{
            try BytesParameter(
                bytes: Bob().address()
            ).value() as? String
        }.notTo(
            equal(
                Alice().rawAddress().lowercased()
            ),
            description: "Make sure same prefixed hex string is returned"
        )
    }
    
}
