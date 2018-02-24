//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// Alice.swift
//
// Created by Vadim Koleoshkin on 24/02/2018
//

/// Female actor for testing
import Foundation
@testable import Web3Swift

public final class Alice: Actor {
    
    private let address: Address
    
    init() {
        // swiftlint:disable:next force_try
        let hex = try! SimpleHex(value: "0x0aD9Fb61a07BAC25625382B63693644497f1B204")
        // swiftlint:disable:next force_try
        address = try! SimpleAddress(hex: hex)
    }
    
    public func toAddress() -> Address
    {
        return address
    }
    
}
