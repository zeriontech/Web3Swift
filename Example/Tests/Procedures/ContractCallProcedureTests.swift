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

import Nimble
import Quick
@testable import Web3Swift

final class ContractCallProcedureTests: XCTestCase {

    func testEOSSupply() {
        expect{
            try ContractCallProcedure(
                network: MainnetInfuraMetamaskNetwork(),
                contractAddress: EthAddress(
                    hex: "0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0"
                ),
                functionCall: EncodedABIFunction(
                    signature: SimpleString(
                        string: "totalSupply()"
                    ),
                    parameters: []
                )
            ).call()["result"].string()
        }.to(
            equal(
                "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"
            ),
            description: "EOS supply is expected to be 1,000,000,000 represented in abi encoded hex number"
        )
    }

    //FIXME: We should deploy an erc20 static wallet on the kovan to be able to rely on in tests
    func testEOSDumpAddressBalance() {
        expect{
            try ContractCallProcedure(
                network: MainnetInfuraMetamaskNetwork(),
                contractAddress: EthAddress(
                    hex: "0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0"
                ),
                functionCall: EncodedABIFunction(
                    signature: SimpleString(
                        string: "balanceOf(address)"
                    ),
                    parameters: [
                        ABIAddress(
                            address: EthAddress(
                                hex: "0x00000000000000000000000000000000000000b1"
                            )
                        )
                    ]
                )
            ).call()["result"].string()
        }.to(
            equal(
                "0x00000000000000000000000000000000000000000052b7d2dcc80cd2e4000000"
            ),
            description: "This dump account is expected to hold 100,000,000 EOS"
        )
    }

}