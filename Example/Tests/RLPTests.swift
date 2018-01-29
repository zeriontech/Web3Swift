//
// Created by Timofey on 1/29/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import XCTest
@testable import Web3Swift

final class RLPTests: XCTestCase {

    func testDog() {
        expect{
            try SimpleRLP(
                bytes: Data(
                    bytes: "dog".utf8.map{ $0 }
                )
            ).toData()
        }.to(
            equal(
                Data(
                    bytes: [0x83] + "dog".utf8.map{ $0 }
                )
            )
        )
    }

    func testCatDog() {
        expect{
            try SimpleRLP(
                rlps: [
                    SimpleRLP(
                        bytes: Data(
                            bytes: "cat".utf8.map{ $0 }
                        )
                    ),
                    SimpleRLP(
                        bytes: Data(
                            bytes: "dog".utf8.map{ $0 }
                        )
                    ),
                ]
            ).toData()
        }.to(
            equal(
                Data(
                    bytes: [
                        0xc8,
                        0x83,
                        "c".utf8.first!,
                        "a".utf8.first!,
                        "t".utf8.first!,
                        0x83,
                        "d".utf8.first!,
                        "o".utf8.first!,
                        "g".utf8.first!
                    ]
                )
            )
        )
    }

    func test0() {
        expect{
            try SimpleRLP(
                bytes: Data(
                    integer: UInt(0).bigEndian
                ).droppingLeadingZeroes()
            ).toData()
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
                bytes: Data(
                    integer: UInt(15).bigEndian
                ).droppingLeadingZeroes()
            ).toData()
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

    func test1024() {
        expect{
            try SimpleRLP(
                bytes: Data(
                    integer: UInt(1024).bigEndian
            ).droppingLeadingZeroes()
            ).toData()
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
            ).toData()
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
                    bytes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit".utf8.map{ $0 }
                )
            ).toData()
        ).to(
            equal(
                Data(
                    bytes: [0xb8, 0x38] + "Lorem ipsum dolor sit amet, consectetur adipisicing elit".utf8.map{ $0 }
                )
            )
        )
    }

    func test1024SymbolsLongString() {
        let string = String(
            bytes: Array<UInt8>(repeating: 0x46, count: 1024),
            encoding: String.Encoding.utf8
        )!
        expect(
            try SimpleRLP(
                bytes: Data(
                    bytes: string.utf8.map{$0}
                )
            ).toData()
        ).to(
            equal(
                Data(
                    bytes: [0xb9, 0x04, 0x00] + string.utf8.map{$0}
                )
            )
        )
    }

}