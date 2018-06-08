//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// VerifiedNetworkTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class VerifiedNetworkTests: XCTestCase {

    func testThrowsWhenNoResultIsPresent() {
        let errorMessage = "mistakes were made"
        let errorData = "42"
        expect{
            try VerifiedNetwork(
                origin: SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant in this test")
                    },
                    call: { _, _ in
                        return try JSON(
                            [
                                "error" : [
                                    "message" : errorMessage,
                                    "data" : errorData
                                ]
                            ]
                        ).rawData()
                    }
                )
            ).call(method: "method is irrelevant in this test", params: [])
        }.to(
            throwError(
                errorType: JSONError.self,
                closure: { error in
                    let messagePart = "Message: \(errorMessage), Data: \(errorData)"
                    expect{
                        error.description
                    }.to(
                        contain(
                            messagePart
                        ),
                        description: "Error message is expected to contain \"\(messagePart)\""
                    )
                }
            ),
            description: "Verified procedure is expected to throw error when no \"result\" is present"
        )
    }

    func testDoesntThrowWhenResultIsPresent() {
        expect{
            try VerifiedNetwork(
                origin: SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant in this test")
                    },
                    call: { _, _ in
                        return try JSON(
                            [
                                "error" : [
                                    "message" : "mistakes were made"
                                ],
                                "result" : "doesn't throw"
                            ]
                        ).rawData()
                    }
                )
            ).call(method: "method is irrelevant in this test", params: [])
        }.toNot(
            throwError(),
            description: "Verified procedure is expected to not throw error when \"result\" is present"
        )
    }

}
