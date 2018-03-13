//
// Created by Timofey on 3/13/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class HexPrefixedStringTests: XCTestCase {

    func testPrefixesUnprefixedStrings() {
        Array<String>(
            [
                "x0",
                "hello",
                "123",
                ""
            ]
        ).forEach{ string in
            expect{
                try HexPrefixedString(
                    origin: SimpleString(
                        string: string
                    )
                ).value()
            }.to(
                equal("0x\(string)"),
                description: "String \(string) is expected to be prefixed by 0x"
            )
        }
    }

    func testDoesntPrefixPrefixedStrings() {
        Array<String>(
            [
                "0x",
                "0xhello",
                "0x123"
            ]
        ).forEach{ string in
            expect{
                try HexPrefixedString(
                    origin: SimpleString(
                        string: string
                    )
                ).value()
            }.to(
                equal(string),
                description: "String \(string) is already prefixed"
            )
        }
    }

}