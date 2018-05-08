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

final class SimpleNetworkTests: XCTestCase {

    func testIdIsPersisted() {
        let id: [UInt8] = [0x2a]
        expect{
            try Array<UInt8>(
                SimpleNetwork(
                    id: {
                        BigEndianNumber(
                            bytes: SimpleBytes(
                                bytes: id
                            )
                        )
                    },
                    call: { _, _ in
                        fatalError("call is irrelevant for this test")
                    }
                ).id().hex().value()
            )
        }.to(
            equal(
                id
            ),
            description: "Id is expected to persist"
        )
    }

    func testCallIsPersisted() {
        let call: [UInt8] = [0x2a]
        expect{
            try Array<UInt8>(
                SimpleNetwork(
                    id: {
                        fatalError("id is irrelevant for this test")
                    },
                    call: { _, _ in
                        return Data(
                            bytes: call
                        )
                    }
                ).call(
                    method: "method is irrelevant for this test",
                    params: []
                )
            )
        }.to(
            equal(
                call
            ),
            description: "Call is expected to persist"
        )
    }

}