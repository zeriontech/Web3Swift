//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// DecodedABIVariableBytes.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//Decoded bytes of variable length
public final class DecodedABIVariableBytes: BytesScalar {

    private let abiMessage: CollectionScalar<BytesScalar>
    private let index: UInt

    /**
    Ctor

    - parameters:
        - abiMessage: message where bytes are located
        - index: position of the bytes
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.abiMessage = abiMessage
        self.index = index
    }

    /**
    - returns:
    Decoded variable bytes

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let abiTuple = self.abiMessage
        let offsetsCount = try BigEndianNumber(
            bytes: BytesAt(
                collection: abiTuple,
                index: index
            )
        ).uint() / 32
        let bytesLength = try BigEndianNumber(
            bytes: BytesAt(
                collection: abiTuple,
                index: offsetsCount
            )
        ).uint()
        return try FirstBytes(
            origin: ConcatenatedBytes(
                bytes: GeneratedCollection<BytesScalar>(
                    element: { index in
                        BytesAt(
                            collection: abiTuple,
                            index: index + offsetsCount + 1
                        )
                    },
                    times: ((bytesLength + 31) / 32)
                )
            ),
            length: bytesLength
        ).value()
    }

}
