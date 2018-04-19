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

//JSON representation of a JSONRPC response error
internal final class JSONError: DescribedError {

    private let error: JSON
    init(error: JSON) {
        self.error = error
    }

    var description: String {
        return error["error"]["message"].string ?? "There was no error in JSON. Here is the dump instead: \(error.debugDescription)"
    }

}

//FIXME: This is a temporary workaround to allow throwing errors communicated by network. It is definitely possible to make this check perform only when the "result" was not found by reimplementing JSON.
//Procedure that throws in case JSON RPC responded with an error
public final class VerifiedProcedure: RemoteProcedure {

    private let origin: RemoteProcedure

    /**
    Ctor

    - parameters:
        - origin: procedure to verify
    */
    public init(origin: RemoteProcedure) {
        self.origin = origin
    }

    /**
    - returns:
    JSON that contains "result"

    - throws:
    `DescribedError` if json did not contain "result"
    */
    public func call() throws -> JSON {
        let json = try origin.call()
        guard json["result"].exists() else {
            throw JSONError(
                error: json
            )
        }
        return json
    }

}