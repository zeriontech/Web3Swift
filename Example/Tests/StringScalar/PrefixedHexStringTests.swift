//
// Created by Timofey on 3/13/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class PrefixedHexStringTests: XCTestCase {

    func testValidPrefixedHexString() {
        Array<String>(
            [
                "0x00",
                "0x01",
                "0x03ff",
                "0x0D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try PrefixedHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal(hex),
                description: "Valid prefixed hex strings are expected to persist"
            )
        }
    }

    func testValidUnprefixedHexString() {
        Array<String>(
            [
                "00",
                "01",
                "03ff",
                "0D8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
            ]
        ).forEach{ hex in
            expect{
                try PrefixedHexString(
                    hex: SimpleString(
                        string: hex
                    )
                ).value()
            }.to(
                equal("0x" + hex),
                description: "Valid unprefixed hex strings are expected to persist and be prefixed"
            )
        }
    }

}