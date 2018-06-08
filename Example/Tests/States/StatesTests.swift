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
            try EarliestBlockChainState().toString()
        }.to(
            equal(
                "earliest"
            ),
            description: "Earliest state is expected to be valid"
        )
    }

    func testLatestStateIsValid() {
        expect{
            try LatestBlockChainState().toString()
        }.to(
            equal(
                "latest"
            ),
            description: "Latest state is expected to be valid"
        )
    }

    func testPendingStateIsValid() {
        expect{
            try PendingBlockChainState().toString()
        }.to(
            equal(
                "pending"
            ),
            description: "Pending state is expected to be valid"
        )
    }
    
    func testExactStateBytesIsValid() {
        expect{
            try ExactBlockChainState(
                number: BytesFromHexString(
                    hex: "0x57d034"
                )
            ).toString()
        }.to(
            equal(
                "0x57d034"
            ),
            description: "Exact state is expected to be valid"
        )
    }
    
    func testExactStateStringScalarIsValid() {
        expect{
            try ExactBlockChainState(
                hex: SimpleString{
                    "0x57d034"
                }
            ).toString()
        }.to(
            equal(
                "0x57d034"
            ),
            description: "Exact state is expected to be valid"
        )
    }
    
    func testExactStateStringIsValid() {
        expect{
            try ExactBlockChainState(
                hex: "0x57d034"
            ).toString()
        }.to(
            equal(
                "0x57d034"
            ),
            description: "Exact state is expected to be valid"
        )
    }

}
