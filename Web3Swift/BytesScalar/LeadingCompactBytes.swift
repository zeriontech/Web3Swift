//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// LeadingCompactBytes.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Bytes without leading zeroes */
public final class LeadingCompactBytes: BytesScalar {

    private let origin: BytesScalar
    /**
    Ctor

    - parameters:
        - origin: bytes to be compacted
    */
    public init(origin: BytesScalar) {
        self.origin = origin
    }

    /**
    - returns:
    bytes as `Data` without leading zeroes (last value in case it is zero is not considered leading)

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> Data {
        let bytes = try origin.value()
        return bytes.dropLast().drop(while: { $0 == 0 }) + [bytes.last].compactMap{ $0 }
    }

}
