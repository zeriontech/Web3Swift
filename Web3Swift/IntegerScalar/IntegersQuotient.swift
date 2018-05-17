//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersQuotient.swift
//
// Created by Timofey Solonin on 17/05/2018
//

import Foundation

public final class IntegersQuotient: IntegerScalar {

    private let dividend: IntegerScalar
    private let divisor: IntegerScalar

    public init(dividend: IntegerScalar, divisor: IntegerScalar) {
        self.dividend = dividend
        self.divisor = divisor
    }

    public func value() throws -> Int {
        return try dividend.value().divideSafely(by: divisor.value())
    }

}