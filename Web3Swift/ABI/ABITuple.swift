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

//A collection of non dynamic elements of fixed length. Parameters of the ABI function are a dynamically typed tuple. Fixed length ABI arrays are a statically typed flatmapped tuple.
final class ABITuple: ABIEncodedParameter {

    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - parameters: a collection of parameters to be encoded as a tuple. All tuples inside tuples must be logically flatmapped to the root tuple. Having tuple in a dynamic collection in a tuple is allowed.
    */
    init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    //TODO: Tuple heads are computed correctly only if it doesn't directly contain another tuple (having tuple in a dynamic collection in a tuple is allowed). This is because of the assumption that every ABI type but tuple has only one element in the heads. Such constraint breaks the declarativity of code when mapping directly from Solidity to Web3Swift ABIEncodedParameter because it imposes the flatmapping of the tuple in a tuple scenario on the user. From the standpoint of the ABI encoding enclosed tuple and flatmapped tuple produce equivalent encodings.
    /**
    - parameters:
        - offset: number of elements preceding the tuple tails

    - returns:
    A collection of heads followed by tails of the tuple parameters
    */
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

    /**
    - parameters:
        - offset: invariant for tails

    - returns:
    Empty collection
    */
    func tails(offset: Int) throws -> [BytesScalar] {
        return []
    }

}
