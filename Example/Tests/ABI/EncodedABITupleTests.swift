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

final class EncodedABITupleTests: XCTestCase {

    func testTwoDimensionalDynamicArrayOfTwoEncoding() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIDynamicCollection(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c5"
                                        )
                                    )
                                ]
                            ),
                            ABIDynamicCollection(
                                parameters: [
                                    ABIAddress(
                                        address: EthAddress(
                                            hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                        )
                                    )
                                ]
                            )
                        ]
                    ),
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c5" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "address[][] is expected to be encoded correctly"
        )
    }

    func testNumberBytesNumberNumberNumberDynamicNumbersArray() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIUnsignedNumber(
                        origin: BigEndianNumber(
                            uint: 1
                        )
                    ),
                    ABIString(
                        origin: SimpleString(
                            string: "gavofyork"
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: BigEndianNumber(
                            uint: 2
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: BigEndianNumber(
                            uint: 3
                        )
                    ),
                    ABIUnsignedNumber(
                        origin: BigEndianNumber(
                            uint: 4
                        )
                    ),
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 5
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 6
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 7
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000001" +
                        "00000000000000000000000000000000000000000000000000000000000000c0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004" +
                        "0000000000000000000000000000000000000000000000000000000000000100" +
                        "0000000000000000000000000000000000000000000000000000000000000009" +
                        "6761766f66796f726b0000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000005" +
                        "0000000000000000000000000000000000000000000000000000000000000006" +
                        "0000000000000000000000000000000000000000000000000000000000000007"
                )
            ),
            description: "int, string, int, int, int, int[] is expected to be encoded correctly"
        )
    }

    func testTwoDynamicIntArrays() {
        expect{
            try EncodedABITuple(
                parameters: [
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 1
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 2
                                )
                            )
                        ]
                    ),
                    ABIDynamicCollection(
                        parameters: [
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 3
                                )
                            ),
                            ABIUnsignedNumber(
                                origin: BigEndianNumber(
                                    uint: 4
                                )
                            )
                        ]
                    )
                ]
            ).value()
        }.to(
            equal(
                Data(
                    hex: "0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004"
                )
            ),
            description: "int[], int[] is expected to be encoded correctly"
        )
    }

}