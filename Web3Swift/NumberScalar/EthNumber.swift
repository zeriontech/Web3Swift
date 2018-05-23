//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthNumber.swift
//
// Created by Timofey Solonin on 14/05/2018
//

import Foundation

/** Unsigned big endian number without leading zeroes */
public final class EthNumber: BytesScalar {

    private let hex: BytesScalar

    /**
    Ctor

    - parameters:
        - hex: hexadecimal representation of the number in big endian order
    */
    public init(hex: BytesScalar) {
        self.hex = TrimmedZeroPrefixBytes(
            origin: hex
        )
    }

    /**
    Ctor

    - parameters:
        - value: natural integer
    */
    public convenience init(value: IntegerScalar) {
        self.init(
            hex: IntegerBytes(
                value: BigEndianInteger(
                    origin: RangeConstrainedInteger(
                        origin: value,
                        minimum: SimpleInteger(
                            integer: 0
                        ),
                        maximum: SimpleInteger(
                            integer: Int.max
                        )
                    )
                )
            )
        )
    }

    /**
    Ctor

    - parameters:
        - value: natural integer
    */
    public convenience init(value: Int) {
        self.init(
            value: SimpleInteger(
                integer: value
            )
        )
    }

    /**
    Ctor

    - parameters:
        - hex: hexadecimal representation of the number in big endian order
    */
    public convenience init(hex: StringScalar) {
        self.init(
            hex: BytesFromCompactHexString(
                hex: hex
            )
        )
    }

    /**
    Ctor

    - parameters:
        - hex: hexadecimal representation of the number in big endian order
    */
    public convenience init(hex: String) {
        self.init(
            hex: SimpleString{ hex }
        )
    }

    /**
    - returns:
    Bytes representation of an unsigned ethereum number
    */
    public func value() throws -> Data {
        return try hex.value()
    }

}