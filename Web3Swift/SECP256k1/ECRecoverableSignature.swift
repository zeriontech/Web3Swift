//
// Created by Timofey on 2/3/18.
//

import Foundation

public protocol ECRecoverableSignature {

    func r() throws -> BytesScalar

    func s() throws -> BytesScalar

    func recoverID() throws -> NumberScalar

}