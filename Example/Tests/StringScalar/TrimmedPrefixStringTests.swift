//
// Created by Timofey on 3/13/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class TrimmedPrefixStringTests: XCTestCase {

    func testTrimsExistentPrefix() {
        Array<
            (
                String,
                String
            )
        >(
            [
                ("hello", "llo"),
                ("he", ""),
                ("he is", " is"),
                ("hehe", "he")
            ]
        ).forEach{ initial, trimmed in
            expect{
                try TrimmedPrefixString(
                    string: SimpleString(
                        string: initial
                    ),
                    prefix: SimpleString(
                        string: "he"
                    )
                ).value()
            }.to(
                equal(trimmed),
                description: "String \(initial) is expected to be trimmed to \(trimmed)"
            )
        }
    }

    func testPersistsWhenMissingPrefix() {
        Array<String>(
            [
                "hi",
                "wohe",
                "",
                "hhe"
            ]
        ).forEach{ initial in
            expect{
                try TrimmedPrefixString(
                    string: SimpleString(
                        string: initial
                    ),
                    prefix: SimpleString(
                        string: "he"
                    )
                ).value()
            }.to(
                equal(initial),
                description: "String \(initial) is expected to persist"
            )
        }
    }

}