//
// This source file is part of the Web3Swift.io open source project
// Copyright 2019 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// CachedProcedureTests.swift
//
// Created by Vadim Koleoshkin on 23/05/2019
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

class CachedProcedureTests: XCTestCase {

    func testCachedProcedure() {
        let json = JSON(
            [
                "Good times bad times" : "Bad times good times"
            ]
        )
        expect{
            try CachedProcedure(
                origin: SimpleProcedure(
                    json: json
                )
            ).call()
        }.to(
            equal(json),
            description: "Json is expected to persist"
        )
    }

}
