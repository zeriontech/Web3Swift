//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthToWei.swift
//
// Created by Timofey Solonin on 08/06/2018
//

import Foundation

//A whole amount of ether converted to an amount of wei
public final class EthToWei: BytesScalar {

    private let amount: BytesScalar

    /**
    Ctor

    - parameters:
        - amount: amount of ethereum to convert to wei
    */
    public init(amount: BytesScalar) {
        self.amount = UnsignedNumbersProduct(
            terms: [
                amount,
                SimpleBytes(
                    bytes: [
                        0x0d, 0xe0, 0xb6, 0xb3, 0xa7, 0x64, 0x00, 0x00
                    ]
                )
            ]
        )
    }

    /**
    Ctor

    - parameters:
        - amount: amount of ethereum to convert to wei
    */
    public convenience init(amount: IntegerScalar) {
        self.init(
            amount: EthNumber(
                value: amount
            )
        )
    }

    /**
    Ctor

    - parameters:
        - amount: amount of ethereum to convert to wei
    */
    public convenience init(amount: Int) {
        self.init(
            amount: SimpleInteger(
                integer: amount
            )
        )
    }

    /**
    - returns:
    The amount of wei in the specified amount of ether (i.e. multiplied by 10^18)
    */
    public func value() throws -> Data {
        return try amount.value()
    }

}