//
// Created by Timofey on 3/19/18.
//

import Foundation

//Hash of a raw transaction data
public protocol TransactionHash: BytesScalar {

    /**
    - returns:
    `Transaction` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    func transaction() throws -> Transaction

    /**
    - returns:
    `TransactionReceipt` that is associated with the hash

    - throws:
    `DescribedError if something went wrong`
    */
    func receipt() throws -> TransactionReceipt

}