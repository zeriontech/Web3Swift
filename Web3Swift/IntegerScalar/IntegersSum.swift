//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// IntegersSum.swift
//
// Created by Timofey Solonin on 15/05/2018
//

import Foundation

public final class IntegersSum: IntegerScalar {

    private let terms: CollectionScalar<Int>

    public init(terms: CollectionScalar<IntegerScalar>) {
        self.terms = MappedCollection(
            origin: terms,
            mapping: { try $0.value() }
        )
    }

    public convenience init(terms: IntegerScalar...) {
        self.init(
            terms: SimpleCollection<IntegerScalar>(
                collection: Array(
                    terms
                )
            )
        )
    }

    public convenience init(terms: Int...) {
        self.init(
            terms: MappedCollection(
                origin: SimpleCollection(
                    collection: Array(
                        terms
                    )
                ),
                mapping: { SimpleInteger(integer: $0) }
            )
        )
    }

    public func value() throws -> Int {
        return try terms.value().reduce(Int(0)) { token, value in
            try token.addSafely(with: value)
        }
    }

}