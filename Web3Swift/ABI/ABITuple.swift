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

final class ABITuple: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]
    init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    func heads(offset: Int) throws -> [BytesScalar] {
        let parameters = self.parameters
        var additionalOffset: Int = offset + parameters.count
        var heads: [BytesScalar] = []
        var tails: [BytesScalar] = []
        try parameters.forEach{ parameter in
            try heads += parameter.heads(
                offset: additionalOffset
            )
            let parameterTails = try parameter.tails(
                offset: additionalOffset
            )
            tails += parameterTails
            additionalOffset += parameterTails.count
        }
        return heads + tails
    }

    func tails(offset: Int) throws -> [BytesScalar] {
        return []
    }

}
