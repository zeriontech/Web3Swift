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

//swiftlint:disable function_body_length

final class ABIDecodingIT: XCTestCase {

    //uint256, string, uint256
    func testIntStringIntIsDecodedCorrectly() {
        let arguments: (UInt, String, UInt) = (1, "gavofyork", 5)
        let message = CachedCollection(
            origin: ABIMessage(
                message: EncodedABITuple(
                    parameters: [
                        ABIUnsignedNumber(
                            origin: BigEndianCompactNumber(
                                origin: BigEndianNumber(
                                    uint: arguments.0
                                )
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: arguments.1
                            )
                        ),
                        ABIUnsignedNumber(
                            origin: BigEndianCompactNumber(
                                origin: BigEndianNumber(
                                    uint: arguments.2
                                )
                            )
                        )
                    ]
                )
            )
        )
        expect{
            try DecodedABINumber(
                abiMessage: message,
                index: 0
            ).uint()
        }.to(
            equal(arguments.0),
            description: "Encoded argument \(arguments.0) is expected to persist"
        )
        expect{
            try DecodedABIString(
                abiMessage: message,
                index: 1
            ).value()
        }.to(
            equal(arguments.1),
            description: "Encoded argument \(arguments.1) is expected to persist"
        )
        expect{
            try DecodedABINumber(
                abiMessage: message,
                index: 2
            ).uint()
        }.to(
            equal(arguments.2),
            description: "Encoded argument \(arguments.2) is expected to persist"
        )
    }

    //address[], bool, string[]
    func testDynamicCollectionOfAddressesBoolDynamicCollectionOfStringsIsDecodedCorrectly() {
        let arguments: (Array<String>, Bool, Array<String>) = (
            [
                "cd8ac90d9cc7e4c03430d58d2f3e87dae70b807e",
                "79d2c50ba0ca4a2c6f8d65eba1358befc1cfd403"
            ],
            false,
            [
                "hello",
                "world",
                "ansha",
                "abdul"
            ]
        )
        let message = CachedCollection(
            origin: ABIMessage(
                message: EncodedABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: arguments.0.map{ address in
                                ABIAddress(
                                    address: EthAddress(
                                        hex: address
                                    )
                                )
                            }
                        ),
                        ABIBoolean(
                            origin: arguments.1
                        ),
                        ABIDynamicCollection(
                            parameters: arguments.2.map{ string in
                                ABIString(
                                    origin: SimpleString(
                                        string: string
                                    )
                                )
                            }
                        )
                    ]
                )
            )
        )
        expect{
            try MappedCollection<BytesScalar, String>(
                origin: DecodedABIDynamicCollection<BytesScalar>(
                    abiMessage: message,
                    mapping: { slice, index in
                        DecodedABIAddress(
                            abiMessage: slice,
                            index: index
                        )
                    },
                    index: 0
                ),
                mapping: { address in
                    try address.value().toHexString()
                }
            ).value()
        }.to(
            equal(arguments.0),
            description: "Encoded argument \(arguments.0) is expected to persist"
        )
        expect{
            try DecodedABIBoolean(
                abiMessage: message,
                index: 1
            ).value()
        }.to(
            equal(arguments.1),
            description: "Encoded argument \(arguments.1) is expected to persist"
        )
        expect{
            try MappedCollection<StringScalar, String>(
                origin: DecodedABIDynamicCollection<StringScalar>(
                    abiMessage: message,
                    mapping: { slice, index in
                        DecodedABIString(
                            abiMessage: slice,
                            index: index
                        )
                    },
                    index: 2
                ),
                mapping: { string in
                    try string.value()
                }
            ).value()
        }.to(
            equal(arguments.2),
            description: "Encoded argument \(arguments.2) is expected to persist"
        )
    }

    //TODO: This is not possible to decode right now. A non elegant solution would be to introduce an dependency "width" for DecodedABIDynamicCollection which would be 1 for every element except for ABITuple.
    //string, address[2][]
//    func testStringDynamicCollectionOfTuplesOfAddressesIsDecodedCorrectly() {
//        let arguments: (String, Array<Array<String>>) = (
//            "hello",
//            [
//                [
//                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8070",
//                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8071"
//                ],
//                [
//                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8072",
//                    "cd8ac90d9cc7e4c03430d58d2f3e87dae70b8073"
//                ]
//            ]
//        )
//        let message = CachedCollection(
//            origin: ABIMessage(
//                message: EncodedABITuple(
//                    parameters: [
//                        ABIString(
//                            origin: SimpleString(
//                                string: arguments.0
//                            )
//                        ),
//                        ABIDynamicCollection(
//                            parameters: arguments.1.map{ addresses in
//                                ABITuple(
//                                    parameters: addresses.map{ address in
//                                        ABIAddress(
//                                            address: EthAddress(
//                                                hex: address
//                                            )
//                                        )
//                                    }
//                                )
//                            }
//                        ),
//                    ]
//                )
//            )
//        )
//        expect{
//            try DecodedABIString(
//                abiMessage: message,
//                index: 0
//            ).value()
//        }.to(
//            equal(arguments.0),
//            description: "Encoded argument \(arguments.0) is expected to persist"
//        )
//    }

}