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

internal final class NotAnASCIIScalarError: DescribedError {

    private let scalar: Unicode.Scalar
    init(scalar: Unicode.Scalar) {
        self.scalar = scalar
    }

    var description: String {
        return "Scalar \(scalar.description) is not an ASCII"
    }

}

//Bytes of the string in ascii representation
final class ASCIIStringBytes: BytesScalar {

    private let string: StringScalar

    /**
    - parameters:
        - string: string to be converted into bytes
    */
    init(string: StringScalar) {
        self.string = string
    }

    /**
    - returns:
    Bytes as `Data` of the ascii representation of the string

    - throws:
    `DescribedError` if something went wrong. For instance if string consists of some elements that are not ascii.
    */
    func value() throws -> Data {
        return try Data(
            bytes: string.value()
                .unicodeScalars
                .map{ scalar in
                    guard scalar.isASCII else {
                        throw NotAnASCIIScalarError(
                            scalar: scalar
                        )
                    }
                    return UInt8(
                        ascii: scalar
                    )
                }
        )
    }
}