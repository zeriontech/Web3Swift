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

class AddressParameterTests: XCTestCase {
    
    /// Assert that parameter returns correct string
    func testAddressParameterToString() {
        
        expect{
            try AddressParameter(
                address: TestingAddress()
            ).value() as! String // swiftlint:disable:this force_cast
        }.to(
            equal(
                TestingAddress().toString()
            ),
            description: "Make sure same prefixed hex string is returned"
        )
        
    }
    
}
