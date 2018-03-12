//
// Created by Timofey on 2/3/18.
//

import Foundation

//Elliptic curve recoverable signature
public protocol ECRecoverableSignature {

    /**
        R point as defined in ecdsa

        - returns:
        bytes representation

        - throws:
        `DescribedError` if something went wrong
    */
    func r() throws -> BytesScalar

    /**
        S point as defined in ecdsa

        - returns:
        bytes representation

        - throws:
        `DescribedError` if something went wrong
    */
    func s() throws -> BytesScalar

    /**
        Recovery id as defined in ecdsa

        - returns:
        a number

        - throws:
        `DescribedError` if something went wrong
    */
    func recoverID() throws -> NumberScalar

}