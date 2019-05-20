//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// Block.swift
//
// Created by Vadim Koleoshkin on 20/05/2019
//

import Foundation

//FIXME: Block description is not full
public protocol Block {
    
    func number() throws -> EthNumber
    
    func hash() throws -> BlockHash
    
    func parentHash() throws -> BlockHash
   
    func timestamp() throws -> EthNumber
    
    func transactions() throws -> CollectionScalar<Transaction>
    
}
