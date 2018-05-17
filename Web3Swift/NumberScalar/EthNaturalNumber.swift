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

/** Big endian compact non-negative number */
public final class EthNaturalNumber: BytesScalar, IntegerScalar {

    private let hex: BytesScalar

    public init(hex: BytesScalar) {
        self.hex = LeadingCompactBytes(
            origin: hex
        )
    }

    public convenience init(origin: BytesScalar) {
        self.init(hex: origin)
    }

    public convenience init(bytes: BytesScalar) {
        self.init(hex: bytes)
    }

    public convenience init(value: BytesScalar) {
        self.init(hex: value)
    }

    public convenience init(value: Int) {
        self.init(
            hex: IntegerBytes(
                value: BigEndianInteger(
                    origin: SimpleInteger(
                        integer: value
                    )
                )
            )
        )
    }

    public convenience init(value: IntegerScalar) {
        self.init(
            hex: IntegerBytes(
                value: BigEndianInteger(
                    origin: value
                )
            )
        )
    }

    public convenience init(hex: StringScalar) {
        self.init(
            hex: BytesFromCompactHexString(
                hex: hex
            )
        )
    }

    public convenience init(hex: String) {
        self.init(
            hex: SimpleString{ hex }
        )
    }

    public func value() throws -> Data {
        return try hex.value()
    }

    public func value() throws -> Int {
        let bytes = try hex.value()
        guard bytes.count <= MemoryLayout<Int>.size else {
            throw IntegerBytesOverflowError(
                bytes: bytes,
                sizeLimit: MemoryLayout<Int>.size
            )
        }
        var integer = Int(0).bigEndian
        bytes.forEach{ byte in
            integer = integer << 8
            integer = integer | Int(byte)
        }
        return integer
    }

}