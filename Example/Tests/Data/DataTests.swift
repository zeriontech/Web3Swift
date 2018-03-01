//
// Created by Timofey on 3/1/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class DataTests: XCTestCase {

    func testAmbiguousHexThrowsFor1() {
        expect{
            try Data(hexValue: "0x1")
        }.to(
            throwError(),
            description: "Ambiguous hex value is expected to result into an exception"
        )
    }

    func testAmbiguousHexThrowsFor1023() {
        expect{
            try Data(hexValue: "0x3ff")
        }.to(
            throwError(),
            description: "Ambiguous hex value is expected to result into an exception"
        )
    }

    func testCorrectHex1() {
        expect{
            try Data(hexValue: "0x01")
        }.to(
            equal(Data(bytes: [0x01])),
            description: "Data created with this hex string is expected to match the bytes it represents"
        )
    }

    func testCorrectHex1023() {
        expect{
            try Data(hexValue: "0x03ff")
        }.to(
            equal(Data(bytes: [0x03, 0xff])),
            description: "Data created with this hex string is expected to match the bytes it represents"
        )
    }

}