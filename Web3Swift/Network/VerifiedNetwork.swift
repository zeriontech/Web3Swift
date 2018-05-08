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
import SwiftyJSON

//Network with an error verified call
public final class VerifiedNetwork: Network {

    private let origin: Network

    /**
    Ctor

    - parameters:
        - origin: network to verify
    */
    public init(origin: Network) {
        self.origin = origin
    }

    /**
    - returns:
    id of a network

    - throws:
    `DescribedError` if something went wrong
    */
    public func id() throws -> NumberScalar {
        return try origin.id()
    }


    /**
    - returns:
    `Data` for a JSON RPC call

    - throws:
    `DescribedError` if something went wrong
    */
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try VerifiedProcedure(
            origin: SimpleProcedure(
                json: JSON(
                    origin.call(
                        method: method,
                        params: params
                    )
                )
            )
        ).call().rawData()
    }

}