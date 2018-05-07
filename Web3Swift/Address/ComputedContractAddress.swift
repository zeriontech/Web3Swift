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

import Foundation

//Computed contract address
public final class ComputedContractAddress: BytesScalar {

    private let address: BytesScalar

    /**
    Ctor

    - parameters:
        - ownerAddress: address of the contract deployer
        - transactionNonce: nonce that was used to deploy the contract
    */
    public init(
        ownerAddress: BytesScalar,
        transactionNonce: NumberScalar
    ) {
        self.address = EthAddress(
            bytes: LastBytes(
                origin: Keccak256Bytes(
                    origin: SimpleRLP(
                        rlps: [
                            SimpleRLP(
                                bytes: ownerAddress
                            ),
                            EthRLP(
                                number: transactionNonce
                            )
                        ]
                    )
                ),
                length: 20
            )
        )
    }

    /**
    - returns:
    Address of the contract as `Data`
    */
    public func value() throws -> Data {
        return try address.value()
    }

}