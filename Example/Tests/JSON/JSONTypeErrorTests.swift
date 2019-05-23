//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// JSONTypeErrorTests.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Nimble
import Quick
import SwiftyJSON
@testable import Web3Swift

final class JSONTypeErrorTests: XCTestCase {

    func testValidStringFromJSONCastsToString() {
        expect{
            try JSON(
                dictionary: [
                    "hello" : "world"
                ]
            )["hello"].string()
        }.to(
            equal("world"),
            description: "Casting String to String from JSON is expected to persist"
        )
    }

    func testNotAStringProducesErrorWhenCastedToString() {
        expect{
            try JSON(
                dictionary: [
                    "hello" : 1
                ]
            )["hello"].string()
        }.to(
            throwError(errorType: InvalidTypeError<String>.self),
            description: "Casting Int to String from JSON is expected throw"
        )
    }

    func testValidIntFromJSONCastsToInt() {
        expect{
            try JSON(
                dictionary: [
                    "hello" : 1
                ]
            )["hello"].int()
        }.to(
            equal(1),
            description: "Casting Int to Int from JSON is expected to persist"
        )
    }

    func testNotAnIntProducesErrorWhenCastedToInt() {
        expect{
            try JSON(
                dictionary: [
                    "hello" : "world"
                ]
            )["hello"].int()
        }.to(
            throwError(errorType: InvalidTypeError<Int>.self),
            description: "Casting String to Int from JSON is expected throw"
        )
    }
    
    func testValidBoolFromJSONCastsToBool() {
        expect{
            try JSON(
                dictionary: [
                    "True" : true
                ]
            )["True"].bool()
        }.to(
            equal(true),
            description: "Casting Bool to Bool from JSON is expected to persist"
        )
    }
    
    func testNotABoolFromJSONCastsToBool() {
        expect{
            try JSON(
                dictionary: [
                    "Rain in the sky" : "make the world fly"
                ]
            )["Rain in the sky"].bool()
        }.to(
            throwError(errorType: InvalidTypeError<Bool>.self),
            description: "Casting String to Bool from JSON is expected throw"
        )
    }

}
