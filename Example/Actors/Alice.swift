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
import CryptoSwift
import Foundation
@testable import Web3Swift

public final class Alice: Actor {

    private let origin = SimpleActor(
        privateKey: EthPrivateKey(
            bytes: BytesFromHexString(
                hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
            )
        )
    )

    public func privateKey() -> PrivateKey {
        return origin.privateKey()
    }

    public func address() -> BytesScalar {
        return origin.address()
    }

    public func rawAddress() -> String {
        return origin.rawAddress()
    }

}
