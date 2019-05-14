//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SignedPersonalMessageBytesTests.swift
//
// Created by Vadim Koleoshkin on 11/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class SignedPersonalMessageBytesTests: XCTestCase {
    
    func testValidSignature()
    {
        expect{
            try SignedPersonalMessageBytes(
                message: "Imagine there's no heaven" +
                "It's easy if you try" +
                "No hell below us" +
                "Above us only sky" +
                "Imagine all the people living for today",
                signerKey: Alice().privateKey()
            ).value().toHexString()
        }.to(
            equal(
            "a70963d7da7a0388c2dc0126efc51b068e6919a9742acba984b9a83688cccba24fd8bc0572af57e872fc5ed351f773fff031035f5a4c9be6491b56ab29b82b8a1b"
            ),
            description: "Make sure signature is valid"
        )
    }
    
    func testValidSignatureFromScalar()
    {
        expect{
            try SignedPersonalMessageBytes(
                message: SimpleString(
                    string: "Imagine there's no countries" +
                    "It isn't hard to do" +
                    "Nothing to kill or die for" +
                    "And no religion too" +
                    "Imagine all the people living life in peace, you"
                ),
                signerKey: Alice().privateKey()
            ).value().toHexString()
        }.to(
            equal(
                "47f7fce8a3be2c375f0f86f9aaff895bdaaac0d419118596ba3688aa0858e02a5ce7a5fab3b9cd777582c45d472b91ca4ac89b84e6f420e6260db7bae213b40d1c"
            ),
            description: "Make sure signature is valid"
        )
    }

}
