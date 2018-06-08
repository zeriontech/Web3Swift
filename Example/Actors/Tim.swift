//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Tim.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation
@testable import Web3Swift

public final class Tim: Actor {

    private let origin = SimpleActor(
        privateKey: EthPrivateKey(
            bytes: BytesFromHexString(
                hex: "0x4836d1e4785f62498ec6a7a61ff0d01e3fa97dba863a76f5a6c3ace47f62be3f"
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
