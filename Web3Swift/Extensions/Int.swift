//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Int.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

internal final class DivisionByZero: DescribedError {

    internal var description: String {
        return "Division by 0 is undefined"
    }

}

internal final class IntegerOverflow: DescribedError {

    private let firstTerm: Int
    private let secondTerm: Int
    private let operation: String

    internal init(firstTerm: Int, secondTerm: Int, operation: String) {
        self.firstTerm = firstTerm
        self.secondTerm = secondTerm
        self.operation = operation
    }

    internal var description: String {
        return "Operations of \(operation) called on \(firstTerm) with \(secondTerm) causes an overflow"
    }

}

extension Int {

    internal func unsignedByteWidth() -> Int {
        return (self.bitWidth - self.leadingZeroBitCount - 1).unsafeDivided(by: 8) + 1
    }

    /**
    Tells if Int is even (divisible by 2 with 0 as a remainder)

    - returns:
    true if even, false if odd
    */
    internal func isEven() -> Bool {
        return self % 2 == 0
    }

    internal func addSafely(with addend: Int) throws -> Int {
        let sum = self.addingReportingOverflow(addend)
        guard sum.overflow == false else {
            throw IntegerOverflow(
                firstTerm: self,
                secondTerm: addend,
                operation: "summation"
            )
        }
        return sum.partialValue
    }

    internal func subtractSafely(from minuend: Int) throws -> Int {
        let difference = minuend.subtractingReportingOverflow(self)
        guard difference.overflow == false else {
            throw IntegerOverflow(
                firstTerm: minuend,
                secondTerm: self,
                operation: "subtraction"
            )
        }
        return difference.partialValue
    }

    internal func multiplySafely(by multiplier: Int) throws -> Int {
        let multiplication = self.multipliedReportingOverflow(by: multiplier)
        guard multiplication.overflow == false else {
            throw IntegerOverflow(
                firstTerm: self,
                secondTerm: multiplier,
                operation: "multiplication"
            )
        }
        return multiplication.partialValue
    }

    internal func divideSafely(by divisor: Int) throws -> Int {
        guard divisor != 0 else {
            throw DivisionByZero()
        }
        let division = self.dividedReportingOverflow(by: divisor)
        guard division.overflow == false else {
            throw IntegerOverflow(
                firstTerm: self,
                secondTerm: divisor,
                operation: "division"
            )
        }
        return division.partialValue
    }

}
