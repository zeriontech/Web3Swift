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

final class SimpleBooleanTests: XCTestCase {

    func testClosureWrappedBooleanPersists() {
        Array<Bool>(
            [
                true,
                false
            ]
        ).forEach{ bool in
            expect{
                try SimpleBoolean{ bool }.value()
            }.to(
                equal(
                    bool
                ),
                description: "Bool value is expected to persist"
            )
        }
    }

    func testDirectValuePersists() {
        Array<Bool>(
            [
                true,
                false
            ]
        ).forEach{ bool in
            expect{
                try SimpleBoolean(bool: bool).value()
            }.to(
                equal(
                    bool
                ),
                description: "Bool value is expected to persist"
            )
        }
    }

    func testErrorsPersist() {
        expect{
            try SimpleBoolean{
                throw UnknownError()
            }.value()
        }.to(
            throwError(errorType: UnknownError.self),
            description: "Errors thrown by the closure are expected to persist"
        )
    }

}