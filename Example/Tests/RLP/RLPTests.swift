//
// Created by Timofey on 1/29/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class RLPTests: XCTestCase {

    func testDog() {
        expect{
            try SimpleRLP(
                bytes: Data(
                    bytes: Array("dog".utf8)
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0x83] + Array("dog".utf8)
                )
            )
        )
    }

    func testCatDog() {
        expect{
            try expect{
                try SimpleRLP(
                    rlps: [
                        SimpleRLP(
                            bytes: Data(
                                bytes: Array("cat".utf8)
                            )
                        ),
                        SimpleRLP(
                            bytes: Data(
                                bytes: Array("dog".utf8)
                            )
                        ),
                    ]
                ).value()
            }.to(
                equal(
                    Data(
                        bytes: [
                            0xc8,
                            0x83,
                            "c".utf8.single(),
                            "a".utf8.single(),
                            "t".utf8.single(),
                            0x83,
                            "d".utf8.single(),
                            "o".utf8.single(),
                            "g".utf8.single()
                        ]
                    )
                )
            )
        }.toNot(
            throwError()
        )
    }

    func test0() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(0).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x00
                    ]
                )
            )
        )
    }

    func test15() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(15).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x0f
                    ]
                )
            )
        )
    }

    func test127() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(127).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x7f
                    ]
                )
            )
        )
    }

    func test128() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(128).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x81,
                        0x80
                    ]
                )
            )
        )
    }

    func test255() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(255).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x81,
                        0xff
                    ]
                )
            )
        )
    }

    func test256() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(256).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x82,
                        0x01,
                        0x00
                    ]
                )
            )
        )
    }

    func test1024() {
        expect{
            try SimpleRLP(
                bytes: LeadingCompactBytes(
                    origin: IntegerBytes(
                        uint: UInt(1024).bigEndian
                    )
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0x82,
                        0x04,
                        0x00
                    ]
                )
            )
        )
    }

    func testRLPs() {
        expect{
            try SimpleRLP(
                rlps: [
                    SimpleRLP(
                        rlps: []
                    ),
                    SimpleRLP(
                        rlps: [
                            SimpleRLP(
                                rlps: []
                            )
                        ]
                    ),
                    SimpleRLP(
                        rlps: [
                            SimpleRLP(
                                rlps: []
                            ),
                            SimpleRLP(
                                rlps: [
                                    SimpleRLP(
                                        rlps: []
                                    )
                                ]
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [
                        0xc7,
                        0xc0,
                        0xc1,
                        0xc0,
                        0xc3,
                        0xc0,
                        0xc1,
                        0xc0
                    ]
                )
            )
        )
    }

    func testLorum() {
        expect(
            try SimpleRLP(
                bytes: Data(
                    bytes: Array("Lorem ipsum dolor sit amet, consectetur adipisicing elit".utf8)
                )
            ).value()
        ).to(
            equal(
                Data(
                    bytes: [0xb8, 0x38] + Array("Lorem ipsum dolor sit amet, consectetur adipisicing elit".utf8)
                )
            )
        )
    }

    func test1024SymbolsLongString() {
        let string = String(
            bytes: Array<UInt8>(repeating: 0x46, count: 1024),
            encoding: String.Encoding.utf8
        )!
        // swiftlint:disable:previous force_unwrapping
        expect{
            try SimpleRLP(
                bytes: Data(
                    bytes: Array(string.utf8)
                )
            ).value()
        }.to(
            equal(
                Data(
                    bytes: [0xb9, 0x04, 0x00] + Array(string.utf8)
                )
            )
        )
    }

}
