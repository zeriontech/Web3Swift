//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// Bob.swift
//
// Created by Vadim Koleoshkin on 24/02/2018
//

/// Male actor for testing
import Foundation
@testable import Web3Swift

public final class Bob: Actor {

    public func address() -> BytesScalar {
        return EthAddress(
            bytes: BytesFromHexString(
                hex: self.rawAddress()
            )
        )
    }

    public func rawAddress() -> String {
        return "0x5F6d691343939aa5C0f6d01ac7038f59EEc38eA0"
    }

}
