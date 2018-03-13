//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class CollectionSingleTests: XCTestCase {

    func testCorrectSingleCollections() {
        expect{
            try "d".single()
        }.toNot(
            throwError(),
            description: "Single of a collection is not expected to throw error when 1 element is present"
        )
    }

    func testBigSingleCollections() {
        expect{
            try "da".single()
        }.to(
            throwError(errorType: IncorrectNumberOfElementsError.self),
            description: "Single of a collection is expected to throw when more than 1 element is present"
        )
    }

    func testEmptySingleCollections() {
        expect{
            try "".single()
        }.to(
            throwError(errorType: IncorrectNumberOfElementsError.self),
            description: "Single of a collection is expected to throw when more than 0 element is present"
        )
    }

}