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

final class ABIMessageTests: XCTestCase {

    func testEmptyMessageThrows() {
        expect{
            try ABIMessage(
                message: SimpleBytes(
                    bytes: []
                )
            ).value()
        }.to(
            throwError(errorType: IndexOutOfBoundsError.self),
            description: "Valid abi message may not be empty"
        )
    }

    func testIncorrectMessageElementsThrow() {
        expect{
            try ABIMessage(
                message: [
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "31643530373130306334000000000000000000000000000000000000000000"
                ].reduce("", +)
            ).value()[1].value()
        }.to(
            throwError(errorType: IncorrectBytesLengthError.self),
            description: "Pieces of a valid abi message must be of length 32"
        )
    }

    func testCorrectMessageIsSegmentedCorrectly() {
        expect{
            try ABIMessage(
                message: [
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633300000000000000000000000000000000000000000000",
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633400000000000000000000000000000000000000000000"
                ].reduce("", +)
            ).value().map{
                try $0.value().toHexString()
            }
        }.to(
            equal(
                [
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633300000000000000000000000000000000000000000000",
                    "000000000000000000000000000000000000000000000000000000000000002a",
                    "3078343037643733643861343965656238356433326366343635353037646437",
                    "3164353037313030633400000000000000000000000000000000000000000000"
                ]
            ),
            description: "Correct message is expected to persist"
        )
    }

}