//
// Created by Timofey on 3/19/18.
//

import Foundation

//Receipt associated with the transaction
public protocol TransactionReceipt {

    /**
    - returns:
    Gas amount that was used up by the transaction

    - throws:
    `DescribedError if something went wrong`
    */
    func usedGasAmount() throws -> NumberScalar

}