//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// TrimmedPrefixString.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//String with trimmed prefix if one exists
public final class TrimmedPrefixString: StringScalar {

    private let string: StringScalar
    private let prefix: StringScalar

    /**
    Ctor

    - parameters:
        - string: string to trim
        - prefix: prefix to search and trim
    */
    public init(string: StringScalar, prefix: StringScalar) {
        self.string = string
        self.prefix = prefix
    }

    /**
    - returns:
    `String` representation of a string without the specified prefix

    - throws:
    `DescribedError` if something went wrong
    */
    public func value() throws -> String {
        let string = try self.string.value()
        let prefix = try self.prefix.value()
        if string.hasPrefix(prefix) {
            return String(
                string.dropFirst(
                    Int(prefix.count)
                )
            )
        } else {
            return string
        }
    }

}
