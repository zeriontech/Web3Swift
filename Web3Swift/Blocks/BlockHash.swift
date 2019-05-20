//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// BlockHash.swift
//
// Created by Vadim Koleoshkin on 14/05/2019
//

import Foundation

/** Standard 32 bytes ethereum transaction hash */
public protocol BlockHash: BytesScalar {
    func block(network: Network) throws -> Block
}
