//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegerBytes.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Bytes representation of an integer */
public final class IntegerBytes: BytesScalar {

    private let uint: UInt
    /**
    Ctor

    - parameters:
        - uint: an integer for which to get bytes. Endiannes should be specified in advanced.
    */
    public init(uint: UInt) {
        self.uint = uint
    }

    /**
    - returns:
    bytes as `Data` of the integer value.

    - throws:
    doesn't throw
    */
    public func value() throws -> Data {
        var integerCopy = uint
        return Data(
            bytes: &integerCopy,
            count: MemoryLayout.size(ofValue: integerCopy)
        )
    }

}
