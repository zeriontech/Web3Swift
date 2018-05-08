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

//Anonymous procedure
public final class SimpleProcedure: RemoteProcedure {

    private let json: () throws -> (JSON)

    /**
    Ctor

    - parameters:
        - json: closure representation of a json returned by the `call` method
    */
    public init(json: @escaping () throws -> (JSON)) {
        self.json = json
    }

    /**
    Ctor

    - parameters:
        - json: json returned by the `call` method
    */
    public convenience init(json: JSON) {
        self.init(json: { json })
    }

    /**
    - returns:
    `JSON` of the procedure

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try json()
    }

}