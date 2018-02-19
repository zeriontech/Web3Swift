//
// Created by Timofey on 2/3/18.
//

import Foundation

protocol ECRecoverableSignature {

    func r() throws -> Data

    func s() throws -> Data

    func recoverID() throws -> UInt8

}