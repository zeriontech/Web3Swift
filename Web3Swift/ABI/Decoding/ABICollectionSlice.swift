//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABICollectionSlice.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** A slice of an non typed abi dynamic collection */
public final class ABICollectionSlice: CollectionScalar<BytesScalar> {

    private let abiMessage: CollectionScalar<BytesScalar>
    private let index: UInt

    /**
    Ctor

    - parameters:
        - abiMessage: message containing the collection
        - index: position of the collection
    */
    public init(
        abiMessage: CollectionScalar<BytesScalar>,
        index: UInt
    ) {
        self.abiMessage = abiMessage
        self.index = index
    }

    //TODO: Right now collection slice grabs everything after the length of the dynamic collection which means that it grabs every parameter encoded into a message after itself. This is irrelevant when decoding but may be a problem in the future.
    /**
    - returns:
    Non typed content of the collection.

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [BytesScalar] {
        return try CollectionSuffix(
            origin: abiMessage,
            from: BigEndianNumber(
                uint: BigEndianNumber(
                    bytes: BytesAt(
                        collection: abiMessage,
                        index: index
                    )
                ).uint() / 32 + 1
            )
        ).value()
    }

}
