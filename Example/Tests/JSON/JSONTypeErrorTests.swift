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

    func testValidArrayFromJSONCastsToArray() {
        expect{
            try JSON(
                dictionary: [
                    "A Hard Day’s Night" : [
                        ["Line1" : "It's been a hard day's night, and I've been working like a dog"],
                        ["Line2" : "It's been a hard day's night, I should be sleeping like a log"],
                        ["Line3" : "But when I get home to you I'll find the things that you do"],
                        ["Line4" : "Will make me feel alright"]
                    ]
                ]
            )["A Hard Day’s Night"].array()
        }.to(
            equal([
                ["Line1" : "It's been a hard day's night, and I've been working like a dog"],
                ["Line2" : "It's been a hard day's night, I should be sleeping like a log"],
                ["Line3" : "But when I get home to you I'll find the things that you do"],
                ["Line4" : "Will make me feel alright"]
            ]),
            description: "Casting Array to Array from JSON is expected to persist"
        )
    }
    
    func testNotAArrayFromJSONCastsToArray() {
        expect{
            try JSON(
                dictionary: [
                    "A Hard Day’s Night" : "10th of July 1964"
                ]
            )["A Hard Day’s Night"].array()
        }.to(
            throwError(errorType: InvalidTypeError<[JSON]>.self),
            description: "Casting String to Array from JSON is expected throw"
        )
    }

}
