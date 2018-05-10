//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CachedNumber.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Permanently cached number */
public final class CachedNumber: NumberScalar {

    private let stickyHex: BytesScalar
    private let stickyUInt: StickyComputation<UInt>

    /**
    - parameters:
        - origin: number to cache
    */
    public init(origin: NumberScalar) {
        self.stickyHex = CachedBytes(
            origin: SimpleBytes{
                try origin.hex().value()
            }
        )
        self.stickyUInt = StickyComputation<UInt>{
            try origin.uint()
        }
    }

    /**
    - returns:
    hex representation of a cached origin

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return stickyHex
    }

    /**
    - returns:
    `UInt` representation of cached origin

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try stickyUInt.result()
    }

}
