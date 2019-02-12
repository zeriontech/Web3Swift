//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleActor.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation
@testable import Web3Swift

public final class SimpleActor: Actor {

    private let key: PrivateKey
    init(privateKey: PrivateKey) {
        self.key = privateKey
    }

    public func privateKey() -> PrivateKey {
        return key
    }

    public func address() -> BytesScalar {
        return try! privateKey().address()
    }

    public func rawAddress() -> String {
        return try! "0x\(privateKey().address().value().toHexString())"
    }

}
