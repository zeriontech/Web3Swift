//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// SimpleNetworkTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
@testable import Web3Swift

final class SimpleNetworkTests: XCTestCase {

    func testIdIsPersisted() {
        let id: [UInt8] = [0x2a]
        expect{
            try Array<UInt8>(
                [
                    UInt8(
                        SimpleNetwork(
                            id: {
                                EthInteger(
                                    hex: SimpleBytes(
                                        bytes: id
                                    )
                                )
                            },
                            call: { _, _ in
                                fatalError("call is irrelevant for this test")
                            }
                        ).id().value()
                    )
                ]
            )
        }.to(
            equal(
                id
            ),
            description: "Id is expected to persist"
        )
    }

    func testCallIsPersisted() {
        let call: [UInt8] = [0x2a]
        expect{
            try Array<UInt8>(
                SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant for this test")
                    },
                    call: { _, _ in
                        return Data(
                            bytes: call
                        )
                    }
                ).call(
                    method: "method is irrelevant for this test",
                    params: []
                )
            )
        }.to(
            equal(
                call
            ),
            description: "Call is expected to persist"
        )
    }

}
