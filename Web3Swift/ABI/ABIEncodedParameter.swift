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

//An encoded ABI parameter
public protocol ABIEncodedParameter {

    /**
    - parameters:
        - offset: number of elements preceding the parameter tails

    - returns:
    A collection of 32 bytes pieces of the head of the encoded parameter.

    - throws:
    `DescribedError` if something went wrong
    */
    func heads(offset: Int) throws -> [BytesScalar]

    /**
    - parameters:
        - offset: number of elements preceding the parameter tails

    - returns:
    A collection of 32 bytes pieces of the tail of the encoded parameter. Tail is empty for "static" parameters.

    - throws:
    `DescribedError` if something went wrong
    */
    func tails(offset: Int) throws -> [BytesScalar]

}