//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EncodedABIFunctionTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

//swiftlint:disable file_length
//swiftlint:disable function_body_length

final class EncodedABIFunctionTests: XCTestCase {

    func testTwoDimensionalDynamicArrayOfTwoEncoding() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
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
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c5" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "Selector + address[][] is expected to be encoded correctly"
        )
    }

    func testTwoDimensionalDynamicArrayOfFourEncoding() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIDynamicCollection(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100cf"
                                        )
                                    ),
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
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
                                    ),
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
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
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100cf" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "Selector + address[][] is expected to be encoded correctly"
        )
    }

    func testSingleAddress() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIAddress(
                        address: EthAddress(
                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                        )
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1"
                )
            ),
            description: "Selector + address is expected to be encoded correctly"
        )
    }

    func testAddressFixedArrayOfTwo() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABITuple(
                        parameters: [
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                )
                            ),
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "Selector + address[2] is expected to be encoded correctly"
        )
    }

    func testAddressDynamicArrayOfTwo() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                )
                            ),
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "Selector + address[] is expected to be encoded correctly"
        )
    }

    func testAddressStaticArrayOfDynamicArraysOf2() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                )
                            ),
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
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
                            ),
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "Selector + address[][2] is expected to be encoded correctly"
        )
    }

    func testAddressDynamicArrayOfStaticArraysOf2() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABITuple(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                        )
                                    ),
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
                                        )
                                    )
                                ]
                            ),
                            ABITuple(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                        )
                                    ),
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
                                        )
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
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "Selector + address[2][] is expected to be encoded correctly"
        )
    }

    func testFixedBytesAndVariableBytes() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIFixedBytes(
                        origin: BytesFromHexString(
                            hex: "0xcf0011"
                        )
                    ),
                    ABIVariableBytes(
                        origin: BytesFromHexString(
                            hex: "0x4d00000000000000000000000000000000000000000000000000000000000012"
                        )
                    )
                ]
            ).value().toHexString()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "cf00110000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "4d00000000000000000000000000000000000000000000000000000000000012"
                ).toHexString()
            ),
            description: "Selector + bytes3, bytes is expected to be encoded correctly"
        )
    }

    func testNumberBytesNumberBytes() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
                parameters: [
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 5
                        )
                    ),
                    ABIVariableBytes(
                        origin: BytesFromHexString(
                            hex: "0x131a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b231a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: EthNumber(
                            value: 3
                        )
                    ),
                    ABIVariableBytes(
                        origin: BytesFromHexString(
                            hex: "0x331a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b431a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                        )
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000005" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "00000000000000000000000000000000000000000000000000000000000000e0" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "131a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "231a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "331a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "431a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                )
            ),
            description: "Selector + int, bytes, int, bytes is expected to be encoded correctly"
        )
    }

    func testNumberBytesNumberNumberNumberDynamicNumbersArray() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
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
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
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
            description: "Selector + int, string, int, int, int, int[] is expected to be encoded correctly"
        )
    }

    func testTwoDynamicIntArrays() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "baz(uint32,bool)"
                ),
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
                    hex: "cdcd77c0" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004"
                )
            ),
            description: "Selector + int[], int[] is expected to be encoded correctly"
        )
    }

}
