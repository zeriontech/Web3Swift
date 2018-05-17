//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleInteger.swift
//
// Created by Timofey Solonin on 15/05/2018
//

import Foundation

public final class SimpleInteger: IntegerScalar {

    private let integer: () throws -> (Int)
    public init(integer: @escaping () throws -> (Int)) {
        self.integer = integer
    }

    public convenience init(integer: Int) {
        self.init(integer: { integer })
    }

    public func value() throws -> Int {
        return try integer()
    }

}