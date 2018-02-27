//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// StringParameterTests.swift
//
// Created by Vadim Koleoshkin on 23/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class StringParameterTests: XCTestCase {
    
    /// Assert parameter does not throw an error
    func testStringParameter() {
        
        expect{
            try StringParameter(value: "0xdeadbeaf").value()
        }.notTo(
            throwError(),
            description: "Make sure that error is not thrown"
        )
        
    }
    
}
