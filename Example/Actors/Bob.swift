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

    private let origin = SimpleActor(
        privateKey: EthPrivateKey(
            bytes: BytesFromHexString(
                hex: "0x159b7c413354adec1bd31caaf7e4fde71e9132a5b29193d2f6181de777745493"
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
