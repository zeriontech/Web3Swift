//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Transaction.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//A transaction from the blockchain
public protocol Transaction {

    /**
    - returns:
    Number of transactions deployed by sender before this one

    - throws:
    `DescribedError` if something went wrong
    */
    func nonce() throws -> NumberScalar

}
