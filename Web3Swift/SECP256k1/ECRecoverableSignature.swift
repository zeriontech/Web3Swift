//
// Created by Timofey on 2/3/18.
//

import Foundation

//Elliptic curve recoverable signature
public protocol ECRecoverableSignature {

    /**
        R value as defined in ecdsa

        - returns:
        bytes representation

        - throws:
        `DescribedError` if something went wrong
    */
    func r() throws -> NumberScalar

    /**
        S value as defined in ecdsa

        - returns:
        bytes representation

        - throws:
        `DescribedError` if something went wrong
    */
    func s() throws -> NumberScalar

    /**
        Recovery id as defined in ecdsa

        - returns:
        a number

        - throws:
        `DescribedError` if something went wrong
    */
    func recoverID() throws -> NumberScalar

}