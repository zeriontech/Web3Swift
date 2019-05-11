//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// PersonalMessageBytesTests.swift
//
// Created by Vadim Koleoshkin on 11/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class PersonalMessageBytesTests: XCTestCase {

    func testMessageEncoding() {
        expect{
            try PersonalMessageBytes(
                message: "Imagine me and you, I do" +
                "I think about you day and night, it's only right" +
                "To think about the girl you love and hold her tight" +
                "So happy together"
            ).value().toHexString()
        }.to(
            equal(
                "19457468657265756d205369676e6564204d6573736167653a0a313430496d6167696e65206d6520616e6420796f752c204920646f49207468696e6b2061626f757420796f752064617920616e64206e696768742c2069742773206f6e6c79207269676874546f207468696e6b2061626f757420746865206769726c20796f75206c6f766520616e6420686f6c6420686572207469676874536f20686170707920746f676574686572"
            ),
            description: "Make sure message is valid"
        )
    }
    
    func testMessageEncodingFromScalar() {
        expect{
            try PersonalMessageBytes(
                message: SimpleString(
                    string: "Me and you and you and me" +
                    "No matter how they toss the dice, it had to be" +
                    "The only one for me is you, and you for me" +
                    "So happy together"
                )
            ).value().toHexString()
        }.to(
            equal(
                "19457468657265756d205369676e6564204d6573736167653a0a3133304d6520616e6420796f7520616e6420796f7520616e64206d654e6f206d617474657220686f77207468657920746f73732074686520646963652c2069742068616420746f206265546865206f6e6c79206f6e6520666f72206d6520697320796f752c20616e6420796f7520666f72206d65536f20686170707920746f676574686572"
            ),
            description: "Make sure message is valid"
        )
    }

}
