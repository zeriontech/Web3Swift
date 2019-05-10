//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecimalFromHexTests.swift
//
// Created by Vadim Koleoshkin on 10/05/2019
//

import Foundation
import Nimble
import Quick
@testable import Web3Swift

class DecimalFromHexTests: XCTestCase {

    func testHexNumberConvertsToAValidDecimal() {
        Array<
            (
                hex: Array<UInt8>,
                decimal: Decimal
            )
        >(
            [
                (
                    hex: [
                        0x00
                    ],
                    decimal: Decimal(0)
                ), (
                    hex: [
                        0x01
                    ],
                    decimal: Decimal(1)
                ),
                   (
                    hex: [
                        0xff
                    ],
                    decimal: Decimal(255)
                ),
                   (
                    hex: [
                        0xff, 0xff
                    ],
                    decimal: Decimal(65535)
                ),
                   (
                    hex: [0x7f] + Array<UInt8>(
                        repeating: 0xff,
                        count: MemoryLayout<Int>.size - 1
                    ),
                    decimal: Decimal(Int.max)
                )
            ]
        ).forEach{ hex, decimal in
            expect{
                try DecimalFromHex(
                    hex: EthNumber(
                        hex: SimpleBytes(
                            bytes: hex
                        )
                    )
                ).value()
            }.to(
                equal(
                    decimal
                ),
                description: "Hexadecimal \(hex) is expected to match decimal \(decimal)"
            )
        }
    }
    
    func testUInt256MaxConvertsToAValidDecimal() {
        expect{
            try DecimalFromHex(
                hex: EthNumber(
                    hex: SimpleBytes(
                        bytes: Array<UInt8>(
                            repeating: 0xff,
                            count: 32
                        )
                    )
                )
            ).value()
        }.to(
            // swiftlint:disable force_unwrapping
            equal(
                Decimal(string: "115792089237316195423570985008687907853269984665640564039457584007913129639935")!
            )
            // swiftlint:enable force_unwrapping
        )
    }

}
