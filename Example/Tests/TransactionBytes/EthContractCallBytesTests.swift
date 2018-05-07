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

final class EthContractCallBytesTests: XCTestCase {

    func testContractCallIsEncodedCorrectly() {
        expect{
            try EthContractCallBytes(
                networkID: BigEndianCompactNumber(
                    hex: "2a"
                ),
                transactionsCount: BigEndianCompactNumber(
                    hex: "06"
                ),
                gasPrice: BigEndianCompactNumber(
                    hex: "0x04A817C800"
                ),
                gasEstimate: BigEndianCompactNumber(
                    hex: "0x0F4240"
                ),
                senderKey: Alice().privateKey(),
                contractAddress: EthAddress(
                    hex: "0x35fb3afcba318f339b1531556bfa14f0ff21df3a"
                ),
                weiAmount: BigEndianCompactNumber(
                    hex: "0x00"
                ),
                functionCall: EncodedABIFunction(
                    signature: SimpleString(
                        string: "number(uint256)"
                    ),
                    parameters: [
                        ABIUnsignedNumber(
                            origin: BigEndianCompactNumber(
                                hex: "0x04A817C800"
                            )
                        )
                    ]
                )
            ).value().toHexString()
        }.to(
            equal(
                "f889068504a817c800830f42409435fb3afcba318f339b1531556bfa14f0ff21df3a80a4431aabc200000000000000000000000000000000000000000000000000000004a817c80077a06f63227e2f509cf2adc00e258410ae9ec58b394a06a0a5233dec79895cea32f1a052b097369a170ba1fd203fbe015694b1a0c3d5d1c84dd6dc2278073dc1997aa7"
            ),
            description: "Contract call is expected to be encoded correctly"
        )
    }

}