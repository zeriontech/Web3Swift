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

//swiftlint:disable function_body_length

//Deployed getter contract data() method return
fileprivate final class DeployedGetterContractArgument: BytesScalar {

    private let network: Network
    private let sender: Actor
    private let contractCode: BytesScalar
    private let arguments: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - network: network where to deploy and read
        - sender: sender account
        - contractCode: raw contract declaration
        - arguments: contract ctor arguments
    */
    init(
        network: Network,
        sender: Actor,
        contractCode: BytesScalar,
        arguments: [ABIEncodedParameter]
    ) {
        self.network = network
        self.sender = sender
        self.contractCode = contractCode
        self.arguments = arguments
    }

    /**
    - returns:
    data() method call from a deployed contract
    */
    func value() throws -> Data {
        guard try VerifiedProcedure(
            origin: SendRawTransactionProcedure(
                network: network,
                transactionBytes: EthContractCreationBytes(
                    network: network,
                    senderKey: sender.privateKey(),
                    weiAmount: BigEndianCompactNumber(
                        origin: BigEndianNumber(
                            uint: UInt(0)
                        )
                    ),
                    contractCall: EncodedContract(
                        byteCode: contractCode,
                        arguments: arguments
                    )
                )
            )
        ).call()["result"].string().isEmpty == false else {
            fatalError("Contract could not be deployed")
        }
        return try BytesFromCompactHexString(
            hex: SimpleString(
                string: VerifiedProcedure(
                    origin: ContractCallProcedure(
                        network: network,
                        contractAddress: ComputedContractAddress(
                            ownerAddress: sender.address(),
                            transactionNonce: BigEndianCompactNumber(
                                origin: BigEndianNumber(
                                    uint: EthTransactions(
                                        network: network,
                                        address: sender.address(),
                                        blockChainState: PendingBlockChainState()
                                    ).count().uint() - 1
                                )
                            )
                        ),
                        functionCall: EncodedABIFunction(
                            signature: SimpleString(
                                string: "data()"
                            ),
                            parameters: []
                        )
                    )
                ).call()["result"].string()
            )
        ).value()
    }

}

final class ContractDeploymentAndCallIT: XCTestCase {

    func testGetterContractIsDeployedAndReadCorrectly() {
        Array<
            (
                contractCode: BytesScalar,
                arguments: [ABIEncodedParameter]
            )
        >(
            [
                (
                    contractCode: BytesFromHexString(
                        hex: "608060405234801561001057600080fd5b5060405160208061010c83398101806040528101908080519060200190929190505050806000806101000a81548160ff021916908360ff1602179055505060b08061005c6000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806373d4a13a146044575b600080fd5b348015604f57600080fd5b5060566072565b604051808260ff1660ff16815260200191505060405180910390f35b6000809054906101000a900460ff16815600a165627a7a723058209ea75712924b4c036e4c802b64f399b06231ee023f7ff10b3eb8e9fc81aff8a10029"
                    ),
                    arguments: [
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 42
                            )
                        )
                    ] as [ABIEncodedParameter]
                ),
                (
                    contractCode: BytesFromHexString(
                        hex: "608060405234801561001057600080fd5b506040516102a43803806102a4833981018060405281019080805182019291905050508060009080519060200190610049929190610050565b50506100f5565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061009157805160ff19168380011785556100bf565b828001600101855582156100bf579182015b828111156100be5782518255916020019190600101906100a3565b5b5090506100cc91906100d0565b5090565b6100f291905b808211156100ee5760008160009055506001016100d6565b5090565b90565b6101a0806101046000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806373d4a13a14610046575b600080fd5b34801561005257600080fd5b5061005b6100d6565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561009b578082015181840152602081019050610080565b50505050905090810190601f1680156100c85780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b60008054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561016c5780601f106101415761010080835404028352916020019161016c565b820191906000526020600020905b81548152906001019060200180831161014f57829003601f168201915b5050505050815600a165627a7a72305820378418d75cc0af4f6b0d8459762f26285d45d4718b8f734259ddf2370402801b0029"
                    ),
                    arguments: [
                        ABIVariableBytes(
                            origin: BytesFromHexString(
                                hex: "12345678"
                            )
                        )
                    ] as [ABIEncodedParameter]
                ),
                (
                    contractCode: BytesFromHexString(
                        hex: "608060405234801561001057600080fd5b506040516020806100f38339810180604052810190808051906020019092919050505080600081600019169055505060a68061004d6000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806373d4a13a146044575b600080fd5b348015604f57600080fd5b5060566074565b60405180826000191660001916815260200191505060405180910390f35b600054815600a165627a7a72305820e1b19747c0a2fee9010c455b8942da7b3d13ad60d7182ef193fab6777de7d6d90029"
                    ),
                    arguments: [
                        ABIFixedBytes(
                            origin: BytesFromHexString(
                                hex: "12345678"
                            )
                        )
                    ] as [ABIEncodedParameter]
                ),
                (
                    contractCode: BytesFromHexString(
                        hex: "608060405234801561001057600080fd5b50604051610211380380610211833981018060405281019080805182019291905050508060009080519060200190610049929190610050565b50506100c8565b828054828255906000526020600020908101928215610092579160200282015b82811115610091578251829060001916905591602001919060010190610070565b5b50905061009f91906100a3565b5090565b6100c591905b808211156100c15760008160009055506001016100a9565b5090565b90565b61013a806100d76000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806373d4a13a14610046575b600080fd5b34801561005257600080fd5b5061005b6100b2565b6040518080602001828103825283818151815260200191508051906020019060200280838360005b8381101561009e578082015181840152602081019050610083565b505050509050019250505060405180910390f35b6060600080548060200260200160405190810160405280929190818152602001828054801561010457602002820191906000526020600020905b815460001916815260200190600101908083116100ec575b50505050509050905600a165627a7a72305820f514b4b177e5d8d4abce081a618186fd8438e4b8b74952e019a2ce755673f70f0029"
                    ),
                    arguments: [
                        ABIDynamicCollection(
                            parameters: [
                                ABIFixedBytes(
                                    origin: BytesFromHexString(
                                        hex: "12"
                                    )
                                ),
                                ABIFixedBytes(
                                    origin: BytesFromHexString(
                                        hex: "34"
                                    )
                                ),
                                ABIFixedBytes(
                                    origin: BytesFromHexString(
                                        hex: "56"
                                    )
                                ),
                                ABIFixedBytes(
                                    origin: BytesFromHexString(
                                        hex: "78"
                                    )
                                )
                            ]
                        )
                    ] as [ABIEncodedParameter]
                ),
            ]
        ).forEach{ contractCode, arguments in
            expect{
                expect{
                    try DeployedGetterContractArgument(
                        network: GanacheLocalNetwork(),
                        sender: Tim(),
                        contractCode: contractCode,
                        arguments: arguments
                    ).value().toHexString()
                }.to(
                    equal(
                        try UnprefixedHexString(
                            bytes: EncodedABITuple(
                                parameters: arguments
                            )
                        ).value()
                    ),
                    description: "Getter contract is expected to return its ctor argument"
                )
                return ()
            }.toNot(
                throwError(),
                description: "Arguments encoding is not expected to throw"
            )
        }
    }

}