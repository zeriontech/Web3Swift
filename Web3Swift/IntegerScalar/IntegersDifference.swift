//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersDifference.swift
//
// Created by Timofey Solonin on 17/05/2018
//

import Foundation

public final class IntegersDifference: IntegerScalar {

    private let minuend: IntegerScalar
    private let subtrahend: IntegerScalar

    public init(minuend: IntegerScalar, subtrahend: IntegerScalar) {
        self.minuend = minuend
        self.subtrahend = subtrahend
    }

    public func value() throws -> Int {
        return try subtrahend.value().subtractSafely(from: minuend.value())
    }

}