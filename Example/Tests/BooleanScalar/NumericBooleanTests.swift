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

final class NumericBooleanTests: XCTestCase {

    func test0ProducesFalseBoolean() {
        expect{
            try NumericBoolean(
                bool: BigEndianNumber(
                    uint: 0
                )
            ).value()
        }.to(
            equal(
                false
            ),
            description: "0 is considered a representation of false"
        )
    }

    func test1ProducesTrueBoolean() {
        expect{
            try NumericBoolean(
                bool: BigEndianNumber(
                    uint: 1
                )
            ).value()
        }.to(
            equal(
                true
            ),
            description: "1 is considered a representation of true"
        )
    }

    func testOtherNumbersThrowError() {
        expect{
            try NumericBoolean(
                bool: BigEndianNumber(
                    uint: 2
                )
            ).value()
        }.to(
            throwError(
                errorType: NotANumericBooleanError.self
            ),
            description: "Numbers other than 0 or 1 are considered to be an error"
        )
    }

}