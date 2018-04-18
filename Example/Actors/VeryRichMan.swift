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
@testable import Web3Swift

public final class VeryRichMan: Actor {

    private let origin = SimpleActor(
        privateKey: EthPrivateKey(
            bytes: BytesFromHexString(
                hex: "0x4836d1e4785f62498ec6a7a61ff0d01e3fa97dba863a76f5a6c3ace47f62be3f"
            )
        )
    )

    public func privateKey() -> PrivateKey {
        return origin.privateKey()
    }

    public func address() -> BytesScalar {
        return origin.address()
    }

    public func rawAddress() -> String {
        return origin.rawAddress()
    }

}