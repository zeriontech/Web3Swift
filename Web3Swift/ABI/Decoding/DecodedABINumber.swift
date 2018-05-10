//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABINumber.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Decoded number */
public final class DecodedABINumber: NumberScalar {

    private let number: NumberScalar

    /**
    Ctor

    - parameters:
        - abiMessage: message where number is located
        - index: position of the number
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.number = BigEndianCompactNumber(
            origin: BigEndianNumber(
                bytes: BytesAt(
                    collection: abiMessage,
                    index: index
                )
            )
        )
    }

    /**
    - returns:
    UInt representation of a decoded number

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try number.uint()
    }

    /**
    - returns:
    Compact hex representation of a decoded number

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return try number.hex()
    }

}
