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

/// An implementation of hex string wrapper
public final class SimpleHex: Hex {
    
    private let hex: String
    
    init(value: String) throws {
        var hexString = value
        if hexString.hasPrefix("0x") {
            hexString = hexString.removingHexPrefix()
        }
        hex = hexString
    }
    
    /**
    Converts object to string
     
    - returns:
    A non prefixed hex string
    */
    public func toString() -> String {
        return hex
    }
    
    /**
    Converts object to string
     
    - returns:
    A prefixed hex string
    */
    public func toPrefixString() -> String {
        return hex.addingHexPrefix()
    }
    
}
