//
// Created by Timofey on 3/19/18.
//

import Foundation

//A transaction from the blockchain
public protocol Transaction {

    /**
    - returns:
    Number of transactions deployed by sender before this one

    - throws:
    `DescribedError` if something went wrong
    */
    func nonce() throws -> NumberScalar

}