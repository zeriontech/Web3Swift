//
// Created by Timofey on 2/1/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

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
        expect{
            try ChainIDProcedure(
                network: TestingEthereumNetwork()
            ).call()["result"].string()
        }.to(
            equal(
                "1"
            )
        )
    }

}
