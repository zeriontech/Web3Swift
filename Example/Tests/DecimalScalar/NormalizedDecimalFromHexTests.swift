//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// NormalizedDecimalFromHexTests.swift
//
// Created by Vadim Koleoshkin on 10/05/2019
//

import Nimble
import Quick
@testable import Web3Swift

class NormalizedDecimalFromHexTests: XCTestCase {

    func testUInt256MaxConvertsToAValidDecimal() {
        expect{
            try NormalizedDecimalFromHex(
                hex: EthNumber(
                    hex: SimpleBytes(
                        bytes: Array<UInt8>(
                            repeating: 0xff,
                            count: 32
                        )
                    )
                ),
                power: 27 // Maker PETH precision
            ).value()
        }.to(
            // swiftlint:disable force_unwrapping
            equal(
                Decimal(string: "115792089237316195423570985008687907853269984665640.564039457584007913129639935")!
            ),
            description: "Max UInt256 with precision 27 should expected to be encoded correctly"
            // swiftlint:enable force_unwrapping
        )
    }
    
}
