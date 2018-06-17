//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CompactHexString.swift
//
// Created by Vadim Koleoshkin on 16/06/2018
//

import Foundation

/** A string that represents hexadecimal numbers in a compact way */
public final class CompactHexString: StringScalar {
    
    private let hex: StringScalar
    
    /**
     Ctor
     
     - parameters:
        - hex: a string describing a hexadecimal
     */
    public init(hex: StringScalar) {
        self.hex = UnprefixedHexString(
            hex: hex
        )
    }
    
    /**
     Ctor
     
     - parameters:
        - bytes: bytes of a hexadecimal
     */
    public convenience init(bytes: BytesScalar) {
        self.init(
            hex: UnprefixedHexString(
                bytes: bytes
            )
        )
    }
    
    /**
     - returns:
     `String` representation of a string describing a hexadecimal
     
     - throws:
     `DescribedError` if something went wrong
     */
    public func value() throws -> String {
        let compactHex = try hex.value()
        return try SimpleString(
                string: String(
                    compactHex.dropLast().drop(while: { $0 == "0" }) + [compactHex.last].compactMap{ $0 }
                )
        ).value().lowercased()
    }
    
}
