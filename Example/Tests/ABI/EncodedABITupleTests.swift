//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EncodedABITupleTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class EncodedABITupleTests: XCTestCase {

    func testTwoDimensionalDynamicArrayOfTwoEncoding() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIDynamicCollection(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c5"
                                        )
                                    )
                                ]
                            ),
                            ABIDynamicCollection(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                        )
                                    )
                                ]
                            )
                        ]
                    ),
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c5" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "address[][] is expected to be encoded correctly"
        )
    }

    func testNumberBytesNumberNumberNumberDynamicNumbersArray() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 1
                        )
                    ),
                    ABIString(
                        origin: SimpleString(
                            string: "gavofyork"
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 2
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 3
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 4
                        )
                    ),
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 5
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 6
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 7
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000001" +
                        "00000000000000000000000000000000000000000000000000000000000000c0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004" +
                        "0000000000000000000000000000000000000000000000000000000000000100" +
                        "0000000000000000000000000000000000000000000000000000000000000009" +
                        "6761766f66796f726b0000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000005" +
                        "0000000000000000000000000000000000000000000000000000000000000006" +
                        "0000000000000000000000000000000000000000000000000000000000000007"
                )
            ),
            description: "int, string, int, int, int, int[] is expected to be encoded correctly"
        )
    }

    func testTwoDynamicIntArrays() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 1
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 2
                                )
                            )
                        ]
                    ),
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 3
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    value: 4
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004"
                )
            ),
            description: "int[], int[] is expected to be encoded correctly"
        )
    }

}
