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
import SwiftyJSON

//A call to the contract function
final public class ContractCallProcedure: RemoteProcedure {

    private let network: Network
    private let contractAddress: BytesScalar
    private let functionCall: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network to call
        - contractAddress: address of the contract
        - functionCall: encoded call the contract function
    */
    public init(
        network: Network,
        contractAddress: BytesScalar,
        functionCall: BytesScalar
    ) {
        self.network = network
        self.contractAddress = contractAddress
        self.functionCall = functionCall
    }

    /**
    - returns:
    `JSON` for the call result

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_call",
                params: [
                    ObjectParameter(
                        dictionary: [
                            "to" : BytesParameter(
                                bytes: contractAddress
                            ),
                            "data" : BytesParameter(
                                bytes: functionCall
                            )
                        ]
                    ),
                    TagParameter(
                        state: PendingBlockChainState()
                    )
                ]
            )
        )
    }

}