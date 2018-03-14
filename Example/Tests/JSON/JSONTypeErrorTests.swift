//
// Created by Timofey on 3/14/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
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

}
