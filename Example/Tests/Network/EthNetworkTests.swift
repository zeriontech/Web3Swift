//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// SimpleNetworkTests.swift
//
// Created by Vadim Koleoshkin on 23/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class EthNetworkTests: XCTestCase {
    
    /// Assert network call does not throw an error on valid params
    func testValidCall() {
        expect{
            try EthNetwork(
                session: URLSession(configuration: URLSessionConfiguration.default),
                url: "https://mainnet.infura.io/v3/0c4d6dc730244b4185a6bde26f981bff",
                headers: [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ]
            ).call(
                method: "web3_sha3",
                params: [
                    BytesParameter(
                        bytes: UTF8StringBytes(
                            string: "web3swift"
                        )
                    )
                ]
            )
        }.notTo(
            throwError(),
            description: "Make sure network call executed succesfully"
        )
    }
    
    /// Assert network call throws an error on invalid url
    func testInValidUrlCall() {
        expect{
            try EthNetwork(
                session: URLSession(configuration: URLSessionConfiguration.default),
                url: "https://mainnet-web3swift.infura.io/metamask",
                headers: [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ]
            ).call(
                method: "web4_sha4",
                params: [
                    BytesParameter(
                        bytes: UTF8StringBytes(
                            string: "web3swift"
                        )
                    )
                ]
            )
        }.to(
            throwError(),
            description: "Make sure network call execution fails"
        )
    }
    
}
