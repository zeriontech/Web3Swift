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

//Bytes of a signed contract function call transaction
public final class EthContractCallBytes: BytesScalar {

    private let origin: BytesScalar

    /**
    Ctor

    - parameters:
        - network: network where transaction is to be deployed
        - senderKey: private key of a sender
        - contractAddress: address of the recipient contract
        - weiAmount: amount to be sent in wei
        - functionCall: encoded function call
    */
    public init(
        network: Network,
        senderKey: PrivateKey,
        contractAddress: BytesScalar,
        weiAmount: NumberScalar,
        functionCall: BytesScalar
    ) {
        let senderAddress = CachedBytes(
            origin: SimpleBytes{
                try senderKey.address().value()
            }
        )
        let contractAddress = CachedBytes(
            origin: contractAddress
        )
        let gasPrice = CachedNumber(
            origin: EthGasPrice(
                network: network
            )
        )
        let functionCall = CachedBytes(
            origin: functionCall
        )
        self.origin = EthTransactionBytes(
            networkID: CachedNumber(
                origin: BigEndianNumber(
                    bytes: SimpleBytes{
                        try network.id().hex().value()
                    }
                )
            ),
            transactionsCount: CachedNumber(
                origin: BigEndianNumber(
                    bytes: SimpleBytes{
                        try EthTransactions(
                            network: network,
                            address: senderAddress,
                            blockChainState: PendingBlockChainState()
                        ).count().hex().value()
                    }
                )
            ),
            gasPrice: gasPrice,
            gasEstimate: CachedNumber(
                origin: EthGasEstimate(
                    network: network,
                    senderAddress: senderAddress,
                    recipientAddress: contractAddress,
                    gasEstimate: EthGasEstimate(
                        network: network,
                        senderAddress: senderAddress,
                        recipientAddress: contractAddress,
                        gasPrice: gasPrice,
                        weiAmount: weiAmount,
                        contractCall: functionCall
                    ),
                    gasPrice: gasPrice,
                    weiAmount: weiAmount,
                    contractCall: functionCall
                )
            ),
            senderKey: senderKey,
            recipientAddress: contractAddress,
            weiAmount: weiAmount,
            contractCall: functionCall
        )
    }

    /**
    - returns:
    Bytes of the encoded abi function call as `Data`
    */
    public func value() throws -> Data {
        return try origin.value()
    }

}