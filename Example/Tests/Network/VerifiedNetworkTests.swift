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
import SwiftyJSON
@testable import Web3Swift

final class VerifiedNetworkTests: XCTestCase {

    func testThrowsWhenNoResultIsPresent() {
        let errorMessage = "mistakes were made"
        let errorData = "42"
        expect{
            try VerifiedNetwork(
                origin: SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant in this test")
                    },
                    call: { _, _ in
                        return try JSON(
                            [
                                "error" : [
                                    "message" : errorMessage,
                                    "data" : errorData
                                ]
                            ]
                        ).rawData()
                    }
                )
            ).call(method: "method is irrelevant in this test", params: [])
        }.to(
            throwError(
                errorType: JSONError.self,
                closure: { error in
                    let messagePart = "Message: \(errorMessage), Data: \(errorData)"
                    expect{
                        error.description
                    }.to(
                        contain(
                            messagePart
                        ),
                        description: "Error message is expected to contain \"\(messagePart)\""
                    )
                }
            ),
            description: "Verified procedure is expected to throw error when no \"result\" is present"
        )
    }

    func testDoesntThrowWhenResultIsPresent() {
        expect{
            try VerifiedNetwork(
                origin: SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant in this test")
                    },
                    call: { _, _ in
                        return try JSON(
                            [
                                "error" : [
                                    "message" : "mistakes were made"
                                ],
                                "result" : "doesn't throw"
                            ]
                        ).rawData()
                    }
                )
            ).call(method: "method is irrelevant in this test", params: [])
        }.toNot(
            throwError(),
            description: "Verified procedure is expected to not throw error when \"result\" is present"
        )
    }

}