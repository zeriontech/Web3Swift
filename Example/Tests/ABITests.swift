/**
Copyright 2018 Timofey Solonin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

final class ABITests: XCTestCase {

    func test() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIDynamicCollection(
                    parameters: [
                        ABIFixedBytes(
                            origin: BytesFromHexString(
                                hex: "0x1234"
                            )
                        ),
                        ABIFixedBytes(
                            origin: BytesFromHexString(
                                hex: "0x5678"
                            )
                        )
                    ]
                ).tails(offset: 0)
            ).value().toHexString()
        }.to(
            equal(
                (
                    Data(
                        bytes: Array<UInt8>(repeating: 0x00, count: 31) + [0x02]
                    ) + Data(
                        bytes: [0x12, 0x34] + Array<UInt8>(repeating: 0x00, count: 30)
                    ) + Data(
                        bytes: [0x56, 0x78] + Array<UInt8>(repeating: 0x00, count: 30)
                    )
                ).toHexString()
            )
        )
    }

}