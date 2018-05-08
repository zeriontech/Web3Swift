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

//Anonymous network
public final class SimpleNetwork: Network {

    private let identifier: () throws -> (NumberScalar)
    private let response: (String, [EthParameter]) throws -> (Data)

    /**
    Ctor

    - parameters:
        - id: closure representation of the id of the network
        - call: closure representation of the call response
    */
    public init(
        id: @escaping () throws -> (NumberScalar),
        call: @escaping (String, [EthParameter]) throws -> (Data)
    ) {
        self.identifier = id
        self.response = call
    }

    /**
    - returns:
    id of the network

    - throws:
    `DescribedError` if something went wrong
    */
    public func id() throws -> NumberScalar {
        return try self.identifier()
    }

    /**
    - returns:
    `Data` for a JSON RPC call

    - throws:
    `DescribedError` if something went wrong
    */
    public func call(method: String, params: Array<EthParameter>) throws -> Data {
        return try self.response(
            method,
            params
        )
    }

}