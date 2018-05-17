//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BigEndianCompactNumber.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** A compact big endian number (without leading zeroes) */
//public final class EthNaturalNumber: BytesScalar {
//
//    private let origin: BytesScalar
//
//    /**
//    Ctor
//
//    - parameters:
//        - origin: number for compact representation
//    */
//    public init(origin: BytesScalar) {
//        self.origin = origin
//    }
//
//    /**
//    Ctor
//
//    - parameters:
//        - hex: compact string representation of the number. A leading zero is added if string representation is a valid hex of odd length.
//    */
//    public convenience init(hex: StringScalar) {
//        self.init(
//            origin: EthNaturalNumber(
//                bytes: BytesFromCompactHexString(
//                    hex: hex
//                )
//            )
//        )
//    }
//
//    /**
//    Ctor
//
//    - parameters:
//        - hex: compact string representation of the number. A leading zero is added if string representation is a valid hex of odd length.
//    */
//    public convenience init(hex: String) {
//        self.init(
//            hex: SimpleString{ hex }
//        )
//    }
//
//    /**
//    - returns:
//    bytes of the number in big endian order without leading zeroes.
//
//    - throws:
//    `DescribedError` if something went wrong
//    */
//    public func value() throws -> Data {
//        return try LeadingCompactBytes(
//            origin: origin
//        ).value()
//    }
//
//}
