//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ABITuple.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//A collection of non dynamic elements of fixed length. Parameters of the ABI function are a dynamically typed tuple. Fixed length ABI arrays are a statically typed flatmapped tuple.
public final class ABITuple: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - parameters: a collection of parameters to be encoded as a tuple. All tuples inside tuples must be logically flatmapped to the root tuple. Having tuple in a dynamic collection in a tuple is allowed.
    */
    public init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    //TODO: Tuple heads are computed correctly only if it doesn't directly contain another tuple (having tuple in a dynamic collection in a tuple is allowed). This is because of the assumption that every ABI type but tuple has only one element in the heads. Such constraint breaks the declarativity of code when mapping directly from Solidity to Web3Swift ABIEncodedParameter because it imposes the flatmapping of the tuple in a tuple scenario on the user. From the standpoint of the ABI encoding enclosed tuple and flatmapped tuple produce equivalent encodings.
    /**
    - parameters:
        - offset: number of elements preceding the tuple tails

    - returns:
    A collection of heads followed by tails of the tuple parameters
    */
    public func heads(offset: Int) throws -> [BytesScalar] {
        let parameters = self.parameters
        var additionalOffset: Int = offset + parameters.count
        var heads: [BytesScalar] = []
        var tails: [BytesScalar] = []
        try parameters.forEach{ parameter in
            try heads += parameter.heads(
                offset: additionalOffset
            )
            let parameterTails = try parameter.tails(
                offset: additionalOffset
            )
            tails += parameterTails
            additionalOffset += parameterTails.count
        }
        return heads + tails
    }

    /**
    - parameters:
        - offset: invariant for tails

    - returns:
    Empty collection
    */
    public func tails(offset: Int) throws -> [BytesScalar] {
        return []
    }

}
