//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// ContractCallProcedure.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation
import SwiftyJSON

//A call to the contract function
final public class ContractCallProcedure: RemoteProcedure {

    private let network: Network
    private let contractAddress: BytesScalar
    private let functionCall: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network to call
        - contractAddress: address of the contract
        - functionCall: encoded call the contract function
    */
    public init(
        network: Network,
        contractAddress: BytesScalar,
        functionCall: BytesScalar
    ) {
        self.network = network
        self.contractAddress = contractAddress
        self.functionCall = functionCall
    }

    /**
    - returns:
    `JSON` for the call result

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_call",
                params: [
                    ObjectParameter(
                        dictionary: [
                            "to" : BytesParameter(
                                bytes: contractAddress
                            ),
                            "data" : BytesParameter(
                                bytes: functionCall
                            )
                        ]
                    ),
                    TagParameter(
                        state: PendingBlockChainState()
                    )
                ]
            )
        )
    }

}
