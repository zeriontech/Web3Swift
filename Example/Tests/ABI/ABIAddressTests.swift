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

final class ABIAddressTests: XCTestCase {

    func testAddressTailIsEmpty() {
        expect{
            try ABIAddress(
                address: EthAddress(
                    hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                )
            ).tails(offset: 0)
        }.to(
            beEmpty(),
            description: "ABIAddress is not expected to have tails"
        )
    }

    func testAddressHeadEncoding() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIAddress(
                    address: EthAddress(
                        hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e"
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(repeating: 0x00, count: 12) + Data(hex: "0xcD8aC90d9cc7e4c03430d58d2f3e87Dae70b807e")
            ),
            description: "ABIAddress is expected to be encoded padded left with zeroes to 32 bytes length"
        )
    }

    func testNonAddressBytesThrow() {
        expect{
            try ConcatenatedBytes(
                bytes: ABIAddress(
                    address: SimpleBytes(
                        bytes: Array<UInt8>(
                            repeating: 0x01,
                            count: 1
                        )
                    )
                ).heads(offset: 0)
            ).value()
        }.to(
            throwError(),
            description: "ABIAddress initialized with improper bytes representation of address is expected to throw"
        )
    }

}
