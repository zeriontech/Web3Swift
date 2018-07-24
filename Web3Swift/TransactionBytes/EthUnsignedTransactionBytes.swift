//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EthUnsignedTransactionBytes.swift
//
// Created by Vadim Koleoshkin on 24/07/2018
//

import Foundation

/** Unsigned transaction bytes */
public final class EthUnsignedTransactionBytes: BytesScalar {
    
    private let networkID: IntegerScalar
    private let transactionsCount: BytesScalar
    private let gasPrice: BytesScalar
    private let gasEstimate: BytesScalar
    private let recipientAddress: BytesScalar
    private let weiAmount: BytesScalar
    private let contractCall: BytesScalar
    
    /**
     Ctor
     
     - parameters:
     - networkID: id of a network where the transaction is to be deployed
     - transactionsCount: count of all transactions previously sent by the sender
     - gasPrice: gas price in Wei
     - gasEstimate: estimate for gas needed for transaction to be mined
     - recipientAddress: address of a recipient
     - weiAmount: amount to be sent in wei
     - contractCall: a bytes representation of the ABI call to the contract
     */
    init(
        networkID: IntegerScalar,
        transactionsCount: BytesScalar,
        gasPrice: BytesScalar,
        gasEstimate: BytesScalar,
        recipientAddress: BytesScalar,
        weiAmount: BytesScalar,
        contractCall: BytesScalar
    ) {
        self.networkID = networkID
        self.transactionsCount = transactionsCount
        self.gasPrice = gasPrice
        self.gasEstimate = gasEstimate
        self.recipientAddress = recipientAddress
        self.weiAmount = weiAmount
        self.contractCall = contractCall
    }
    
    
    /**
     It should be noted that 35 is the magic number suggested by EIP155 https://github.com/ethereum/EIPs/blob/master/EIPS/eip-155.md
     
     - returns:
     unsigned transaction as `Data`
     
     - throws:
     `DescribedError` if something went wrong
     */
    public func value() throws -> Data {
        return try SimpleRLP(
            rlps: [
                EthRLP(number: transactionsCount),
                EthRLP(number: gasPrice),
                EthRLP(number: gasEstimate),
                SimpleRLP(bytes: recipientAddress),
                EthRLP(number: weiAmount),
                SimpleRLP(bytes: contractCall),
                EthRLP(
                    number: EthNumber(value: networkID)
                ),
                SimpleRLP(bytes: []),
                SimpleRLP(bytes: [])
            ]
        ).value()
    }
    
}
