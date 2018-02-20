//
// Created by Timofey on 2/1/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Web3Swift

final class ChainIDProcedureTests: XCTestCase {

    func testNoThrow() {
        expect(
            try ChainIDProcedure(
                network: TestingEthereumNetwork()
            ).call()
        ).toNot(
            throwError()
        )
    }
    
    func testMainNetID() {
        expect(
            try ChainIDProcedure(
                network: TestingEthereumNetwork()
            ).call()["result"].string()
        ).to(
            equal(
                "1"
            )
        )
    }

}
