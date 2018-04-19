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

fileprivate final class FakeProcedure: RemoteProcedure {

    private let response: JSON
    init(response: JSON) {
        self.response = response
    }

    fileprivate func call() throws -> JSON {
        return response
    }

}

final class VerifiedProcedureTests: XCTestCase {

    func testThrowsWhenNoResultIsPresent() {
        let errorMessage = "mistakes were made"
        expect{
            try VerifiedProcedure(
                origin: FakeProcedure(
                    response: JSON(
                        [
                            "error" : [
                                "message" : errorMessage
                            ]
                        ]
                    )
                )
            ).call()
        }.to(
            throwError(
                errorType: JSONError.self,
                closure: { error in
                    expect{
                        error.description
                    }.to(
                        equal(
                            errorMessage
                        ),
                        description: "Error message is expected to be \(errorMessage)"
                    )
                }
            ),
            description: "Verified procedure is expected to throw error when no \"result\" is present"
        )
    }

    func testDoesntThrowWhenResultIsPresent() {
        expect{
            try VerifiedProcedure(
                origin: FakeProcedure(
                    response: JSON(
                        [
                            "error" : [
                                "message" : "mistakes were made"
                            ],
                            "result" : "doesn't throw"
                        ]
                    )
                )
            ).call()
        }.toNot(
            throwError(),
            description: "Verified procedure is expected to not throw error when \"result\" is present"
        )
    }

}