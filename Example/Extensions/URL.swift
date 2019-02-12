//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// URL.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

fileprivate class InvalidURLStringError: Swift.Error { }

extension URL {

    init(string: String) throws {
        if let url = (URL(string: string) as URL?) {
            self = url
        } else {
            throw InvalidURLStringError()
        }
    }

}
