//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// Hex.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Foundation

/// Protocol for wrapping hex strings
public protocol Hex {
    
    func toString() -> String
    
    func toPrefixString() -> String
    
}
