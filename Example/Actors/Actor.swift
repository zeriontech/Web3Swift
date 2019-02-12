//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// Actor.swift
//
// Created by Vadim Koleoshkin on 24/02/2018
//

import Foundation
@testable import Web3Swift

protocol Actor {

    func privateKey() -> PrivateKey
    
    func address() -> BytesScalar

    func rawAddress() -> String
    
}
