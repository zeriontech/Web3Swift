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
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                )
            ).call()
        ).toNot(
            throwError()
        )
    }
    
    func testMainNetID() {
        expect(
            try ChainIDProcedure(
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                )
            ).call()["result"].string()
        ).to(
            equal(
                "1"
            )
        )
    }

}
