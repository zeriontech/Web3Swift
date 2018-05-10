//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthBalance.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

/** Balance of an address */
public final class EthBalance: NumberScalar {

    private let origin: NumberScalar

    /**
    Ctor

    - parameters:
        - network: network to ask for balance
        - address: address of the balance
    */
    public init(
        network: Network,
        address: BytesScalar
    ) {
        self.origin = BigEndianCompactNumber(
            hex: SimpleString{
                try BalanceProcedure(
                    network: network,
                    address: address,
                    state: PendingBlockChainState()
                ).call()["result"].string()
            }
        )
    }

    /**
    - returns:
    Balance in `UInt`

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try origin.uint()
    }

    /**
    - returns:
    Balance in hex

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return try origin.hex()
    }

}
