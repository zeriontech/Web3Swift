//
// Created by Timofey on 3/12/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import Web3Swift

final class UTF8StringBytesTests: XCTestCase {

    func testCorrectUTF8Bytes() {
        expect{
            try UTF8StringBytes(
                string: "Hello world"
            ).value()
        }.to(
            equal(
                Data(
                    bytes: Array("Hello world".utf8)
                )
            )
        )
    }

}