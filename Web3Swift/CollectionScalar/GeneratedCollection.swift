//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// GeneratedCollection.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//Generated collection
public final class GeneratedCollection<T>: CollectionScalar<T> {

    private let element: (_ index: UInt) throws -> (T)
    private let times: UInt

    /**
    Ctor

    - parameters:
        - element: indexed element factory called up to `times` times
        - times: number of times to call the factory
    */
    public init(
        element: @escaping (_ index: UInt) throws -> (T),
        times: UInt
    ) {
        self.element = element
        self.times = times
    }

    /**
    - returns:
    A collection of generated element of size `times`

    - throws:
    `DescribedError` if something went wrong
    */
    public override func value() throws -> [T] {
        return try (0..<times).map{ index in
            try element(index)
        }
    }

}
