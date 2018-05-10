//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleProcedureTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class SimpleProcedureTests: XCTestCase {

    func testJsonIsPersisted() {
        let json = JSON(
            [
                "hello" : "world"
            ]
        )
        expect{
            try SimpleProcedure(
                json: json
            ).call()
        }.to(
            equal(json),
            description: "Json is expected to persist"
        )
    }

}
