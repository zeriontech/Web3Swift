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
                message: "Hello World!",
                signerKey: Alice().privateKey()
            ).value().toHexString()
        }.to(
            equal("22b68ea178be3fbbdd6636e79db7d6357821b1f521adbdef3519c5314526535a38346d9437064ae8da46283297540051f078e296e67277931b0fb0e29d42e86c1b"),
            description: "Make sure signature is valid"
        )
    }

}
