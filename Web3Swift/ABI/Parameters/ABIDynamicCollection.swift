//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABIDynamicCollection.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//A collection of ABI parameters encoded as an ABI parameter
public final class ABIDynamicCollection: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - parameters: ABI parameters to be encoded as a dynamic collection
    */
    public init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    /**
    - parameters:
        - offset: number of elements preceding the dynamic collection tails

    - returns:
    A collection with a single element representing a distance from the beginning of the encoding to the tails of the dynamic collection
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        return [
            LeftZeroesPaddedBytes(
                origin: SimpleBytes{
                    try BigEndianNumber(
                        uint: UInt(offset) * 32
                    ).hex().value()
                },
                padding: 32
            )
        ]
    }

    /**
    - parameters:
        - offset: number of elements preceding the dynamic collection tails

    - returns:
    A collection of the parameters encodings prefixed by the parameters count. Parameters encodings are offset by the previous offset plus a 1 for the count prefix.
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        let parameters = self.parameters
        return try [
            LeftZeroesPaddedBytes(
                origin: SimpleBytes{
                    try BigEndianNumber(
                        uint: UInt(parameters.count)
                    ).hex().value()
                },
                padding: 32
            )
        ] + ABITuple(
            parameters: parameters
        ).heads(
            offset: 0
        )
    }

}
