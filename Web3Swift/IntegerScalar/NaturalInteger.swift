//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// NaturalInteger.swift
//
// Created by Timofey Solonin on 16/05/2018
//

import Foundation

public final class NaturalInteger: IntegerScalar {

    private let hex: BytesScalar

    public init(hex: BytesScalar) {
        self.hex = LeadingCompactBytes(
            origin: hex
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
            hex: SimpleString(
                string: hex
            )
        )
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