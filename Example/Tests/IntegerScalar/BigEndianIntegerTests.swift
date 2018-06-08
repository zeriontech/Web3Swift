//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BigEndianIntegerTests.swift
//
// Created by Timofey Solonin on 22/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class BigEndianIntegerTests: XCTestCase {

    func testBigEndianRepresentationIsCorrect() {
        expect{
            try UnprefixedHexString(
                bytes: TrimmedZeroPrefixBytes(
                    origin: IntegerBytes(
                        value: BigEndianInteger(
                            origin: SimpleInteger(
                                integer: 255
                            )
                        )
                    )
                )
            ).value()
        }.to(
            equal(
                "ff"
            )
        )
    }

}