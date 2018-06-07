//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// StatesTests.swift
//
// Created by Timofey Solonin on 07/06/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class StatesTests: XCTestCase {

    func testEarliestStateIsValid() {
        expect{
            EarliestBlockChainState().toString()
        }.to(
            equal(
                "earliest"
            ),
            description: "Earliest state is expected to be valid"
        )
    }

    func testLatestStateIsValid() {
        expect{
            LatestBlockChainState().toString()
        }.to(
            equal(
                "latest"
            ),
            description: "Latest state is expected to be valid"
        )
    }

    func testPendingStateIsValid() {
        expect{
            PendingBlockChainState().toString()
        }.to(
            equal(
                "pending"
            ),
            description: "Pending state is expected to be valid"
        )
    }

}