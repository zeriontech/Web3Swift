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

final class ComputedContractAddressTests: XCTestCase {

    func testContractAddressesAreComputedCorrectly() {
        Array<
            (
                nonce: String,
                address: String
            )
        >(
            [
                (
                    nonce: "0x00",
                    address: "72f72a290a84804b8079b2bba7e4ddd00f9aae5f"
                ),
                (
                    nonce: "0x7f",
                    address: "8c61d6f129c36a012c2995c658fb2c83aeb66079"
                ),
                (
                    nonce: "0x80",
                    address: "e11257ee767583a1ea4cfcee9db066f31eccaffa"
                )
            ]
        ).forEach{ nonce, address in
            let owner = Tim()
            expect{
                try ComputedContractAddress(
                    ownerAddress: owner.address(),
                    transactionNonce: BigEndianCompactNumber(
                        hex: nonce
                    )
                ).value().toHexString()
            }.to(
                equal(
                    address
                ),
                description: "Contract address from \(owner.address()) at nonce \(nonce) is expected to be \(address)"
            )
        }
    }

}