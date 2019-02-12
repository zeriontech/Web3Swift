//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Encode0xProtocolABIFunctionTests.swift
//
// Created by Vadim Koleoshkin on 11/02/2019
//

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class Encode0xProtocolABIFunctionTests: XCTestCase {

    func testFirstArgumentDynamicTupleEncoding() {
        expect{
            try EncodedABIFunction(
                signature: SimpleString(
                    string: "getOrderInfo((" +
                        "address," +
                        "address," +
                        "address," +
                        "address," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "bytes," +
                        "bytes))"
                ),
                parameters: [
                    ABITuple(
                        parameters: [
                            // makerAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0aD9Fb61a07BAC25625382B63693644497f1B204"
                                )
                            ),
                            // takerAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x4dB6d56Bbb49DD66abC7be5D671fDdF9a5255Cc5"
                                )
                            ),
                            // feeRecipientAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0000000000000000000000000000000000000000"
                                )
                            ),
                            // senderAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0000000000000000000000000000000000000000"
                                )
                            ),
                            // makerAssetAmount
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1)
                            ),
                            // takerAssetAmount
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1)
                            ),
                            // makerFee
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 0)
                            ),
                            // takerFee
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 0)
                            ),
                            // expiration timestamp
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1654891200)
                            ),
                            // salt
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    hex: "342FE4E437CADAAB85C56332FD31233C23405877DF8702D7A6C7F84F83DB38FD"
                                )
                            ),
                            // makerAssetData
                            ABIVariableBytes(
                                origin: RightZeroesPaddedBytes(
                                    origin: EncodedABIFunction(
                                        signature: SimpleString(
                                            string: "ERC721Token(address,uint256)"
                                        ),
                                        parameters: [
                                            ABIAddress(
                                                address: EthAddress(
                                                    hex: "0x06012c8cf97bead5deae237070f9587f8e7a266d"
                                                )
                                            ),
                                            ABIUnsignedNumber(
                                                origin: EthNumber(value: 478404)
                                            )
                                        ]
                                    ),
                                    padding: 32
                                )
                            ),
                            // takerAssetData
                            ABIVariableBytes(
                                origin: RightZeroesPaddedBytes(
                                    origin: EncodedABIFunction(
                                        signature: SimpleString(
                                            string: "ERC721Token(address,uint256)"
                                        ),
                                        parameters: [
                                            ABIAddress(
                                                address: EthAddress(
                                                    hex: "0x06012c8cf97bead5deae237070f9587f8e7a266d"
                                                )
                                            ),
                                            ABIUnsignedNumber(
                                                origin: EthNumber(value: 392919)
                                            )
                                        ]
                                    ),
                                    padding: 32
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
                equal(
                    Data(
                        hex: "c75e0a81" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000ad9fb61a07bac25625382b63693644497f1b204" +
                        "0000000000000000000000004db6d56bbb49dd66abc7be5d671fddf9a5255cc5" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000062a3a2c0" +
                        "342fe4e437cadaab85c56332fd31233c23405877df8702d7a6c7f84f83db38fd" +
                        "00000000000000000000000000000000000000000000000000000000000001a0" +
                        "0000000000000000000000000000000000000000000000000000000000000220" +
                        "0000000000000000000000000000000000000000000000000000000000000060" +
                        "0257179200000000000000000000000006012c8cf97bead5deae237070f9587f" +
                        "8e7a266d00000000000000000000000000000000000000000000000000000000" +
                        "00074cc400000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000060" +
                        "0257179200000000000000000000000006012c8cf97bead5deae237070f9587f" +
                        "8e7a266d00000000000000000000000000000000000000000000000000000000" +
                        "0005fed700000000000000000000000000000000000000000000000000000000"
                    )
                ),
                description: "Dynamic tuple as a first argument is expected to be encoded correctly"
        )
    }
    
    func testFirstArgumentDynamicTupleUInt256DynamicBytesEncoding() {
        expect{
            let a = try EncodedABIFunction(
                signature: SimpleString(
                    string: "fillOrder((" +
                        "address," +
                        "address," +
                        "address," +
                        "address," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "uint256," +
                        "bytes,"  +
                        "bytes)," +
                        "uint256," +
                        "bytes" +
                        ")"
                ),
                parameters: [
                    ABITuple(
                        parameters: [
                            // makerAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0aD9Fb61a07BAC25625382B63693644497f1B204"
                                )
                            ),
                            // takerAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x4dB6d56Bbb49DD66abC7be5D671fDdF9a5255Cc5"
                                )
                            ),
                            // feeRecipientAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0000000000000000000000000000000000000000"
                                )
                            ),
                            // senderAddress
                            ABIAddress(
                                address: EthAddress(
                                    hex: "0x0000000000000000000000000000000000000000"
                                )
                            ),
                            // makerAssetAmount
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1)
                            ),
                            // takerAssetAmount
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1)
                            ),
                            // makerFee
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 0)
                            ),
                            // takerFee
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 0)
                            ),
                            // expiration timestamp
                            ABIUnsignedNumber(
                                origin: EthNumber(value: 1654891200)
                            ),
                            // salt
                            ABIUnsignedNumber(
                                origin: EthNumber(
                                    hex: "342FE4E437CADAAB85C56332FD31233C23405877DF8702D7A6C7F84F83DB38FD"
                                )
                            ),
                            // makerAssetData
                            ABIVariableBytes(
                                origin: RightZeroesPaddedBytes(
                                    origin: EncodedABIFunction(
                                        signature: SimpleString(
                                            string: "ERC721Token(address,uint256)"
                                        ),
                                        parameters: [
                                            ABIAddress(
                                                address: EthAddress(
                                                    hex: "0x06012c8cf97bead5deae237070f9587f8e7a266d"
                                                )
                                            ),
                                            ABIUnsignedNumber(
                                                origin: EthNumber(value: 478404)
                                            )
                                        ]
                                    ),
                                    padding: 32
                                )
                            ),
                            // takerAssetData
                            ABIVariableBytes(
                                origin: RightZeroesPaddedBytes(
                                    origin: EncodedABIFunction(
                                        signature: SimpleString(
                                            string: "ERC721Token(address,uint256)"
                                        ),
                                        parameters: [
                                            ABIAddress(
                                                address: EthAddress(
                                                    hex: "0x06012c8cf97bead5deae237070f9587f8e7a266d"
                                                )
                                            ),
                                            ABIUnsignedNumber(
                                                origin: EthNumber(value: 392919)
                                            )
                                        ]
                                    ),
                                    padding: 32
                                )
                            )
                        ]
                    ),
                    ABIUnsignedNumber(
                        origin: EthNumber(value: 1)
                    ),
                    ABIVariableBytes(
                        origin: RightZeroesPaddedBytes(
                            origin: BytesFromHexString(
                                hex: "1b4b18e86f5a19d28ba09baa5436c2fbb30283d49371c53ef313335779cd80aa" +
                                "ad3780f7eee006379767798cee993dbddd26b26b583a39916c46d637d4f47a62" +
                                "7c03"
                            ),
                            padding: 32
                        )
                    )
                ]
            ).value()
            
            print(a.toHexString())
            
            return a
        }.to(
                equal(
                    Data(
                        hex: "b4be83d5" +
                            "0000000000000000000000000000000000000000000000000000000000000060" +
                            "0000000000000000000000000000000000000000000000000000000000000001" +
                            "00000000000000000000000000000000000000000000000000000000000002c0" +
                            "0000000000000000000000000ad9fb61a07bac25625382b63693644497f1b204" +
                            "0000000000000000000000004db6d56bbb49dd66abc7be5d671fddf9a5255cc5" +
                            "0000000000000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000000000001" +
                            "0000000000000000000000000000000000000000000000000000000000000001" +
                            "0000000000000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000062a3a2c0" +
                            "342fe4e437cadaab85c56332fd31233c23405877df8702d7a6c7f84f83db38fd" +
                            "00000000000000000000000000000000000000000000000000000000000001a0" +
                            "0000000000000000000000000000000000000000000000000000000000000220" +
                            "0000000000000000000000000000000000000000000000000000000000000060" +
                            "0257179200000000000000000000000006012c8cf97bead5deae237070f9587f" +
                            "8e7a266d00000000000000000000000000000000000000000000000000000000" +
                            "00074cc400000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000000000060" +
                            "0257179200000000000000000000000006012c8cf97bead5deae237070f9587f" +
                            "8e7a266d00000000000000000000000000000000000000000000000000000000" +
                            "0005fed700000000000000000000000000000000000000000000000000000000" +
                            "0000000000000000000000000000000000000000000000000000000000000042" +
                            "1b4b18e86f5a19d28ba09baa5436c2fbb30283d49371c53ef313335779cd80aa" +
                            "ad3780f7eee006379767798cee993dbddd26b26b583a39916c46d637d4f47a62" +
                            "7c03000000000000000000000000000000000000000000000000000000000000"
                    )
                ),
                description: "Dynamic tuple as a first argument is expected to be encoded correctly"
        )
    }
}
