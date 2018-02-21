//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleHex.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Foundation

public final class InvalidHexError: Swift.Error { }

public final class SimpleHex: Hex {
    
    private let hex: String
    
    init(value: String) throws {
        
        var hexString = value
        
        if hexString.hasPrefix("0x") {
            hexString = hexString.removingHexPrefix()
        }
        
        guard hexString.range(of: "^[a-f0-9]+$", options: [.regularExpression, .caseInsensitive]) != nil else {
            throw InvalidHexError()
        }
        
        hex = hexString
    
    }
    
    public func toString() -> String {
        return hex
    }
    
    public func toPrefixString() -> String {
        return hex.addingHexPrefix()
    }
    
}
