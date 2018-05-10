//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthGasPrice.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//Gas price computed by the network
public final class EthGasPrice: NumberScalar {

    private let value: NumberScalar

    /**
    Ctor

    - parameters:
        - network: network to ask for gas price
    */
    public init(network: Network) {
        self.value = BigEndianCompactNumber(
            hex: SimpleString{
                try GetGasPriceProcedure(
                    network: network
                ).call()["result"].string()
            }
        )
    }

    /**
    - returns:
    Compact hex representation of a gas price

    - throws:
    `DescribedError` if something goes wrong
    */
    public func hex() throws -> BytesScalar {
        return try value.hex()
    }

    /**
    - returns:
    Integer representation of a gas price

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try value.uint()
    }

}
