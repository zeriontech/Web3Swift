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

import CryptoSwift
import Foundation

internal final class NotUTF8BytesError: DescribedError {

    private let bytes: Data
    public init(bytes: Data) {
        self.bytes = bytes
    }

    internal var description: String {
        return "Bytes 0x\(bytes.toHexString()) do not produce a valid utf8 string"
    }

}

//utf8 string
public final class UTF8String: StringScalar {

    private let bytes: BytesScalar
    /**
    Ctor

    - parameters:
        - bytes: bytes representation of a utf8 string
    */
    public init(bytes: BytesScalar) {
        self.bytes = bytes
    }

    /**
    - returns:
    UTF8 encoded string
    
    - throws:
    `DescribedError` if something went wrong. I.e. if string was not utf8
    */
    public func value() throws -> String {
        let bytes = try self.bytes.value()
        guard let value = String(
            bytes: bytes,
            encoding: String.Encoding.utf8
        ) else {
            throw NotUTF8BytesError(
                bytes: bytes
            )
        }
        return value
    }

}
