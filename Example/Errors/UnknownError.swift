//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// UnknownError.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation
import Web3Swift

public final class UnknownError: DescribedError {

    public var description: String {
        return "The error cause is unknown"
    }

}
