//
// Created by Timofey on 3/13/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class HexPrefixTests: XCTestCase {

    func testCorrectValue() {
        expect{
            try HexPrefix().value()
        }.to(
            equal("0x"),
            description: "Hex prefix is expected to be 0x"
        )
    }

}