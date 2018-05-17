//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BigEndianInteger.swift
//
// Created by Timofey Solonin on 16/05/2018
//

import Foundation

public final class BigEndianInteger: IntegerScalar {

    private let origin: IntegerScalar
    public init(origin: IntegerScalar) {
        self.origin = origin
    }

    public func value() throws -> Int {
        return try origin.value().bigEndian
    }

}