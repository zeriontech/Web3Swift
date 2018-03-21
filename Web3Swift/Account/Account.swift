//
// Created by Timofey on 3/19/18.
//

import Foundation

//An account that is associated with some private key on the network
public protocol Account {

    /**
    TODO: I am not sure whether the Account should promise to return its balance in wei
    - returns:
    The amount of value the `Account` holds

    - throws:
    `DescribedError` if something went wrong
    */
    func balance() throws -> NumberScalar

    /**
    Send the specified amount to the recipient

    - parameters:
        - weiAmount: amount to be sent in wei
        - recipientAddress: address of the recipient

    - returns:
    `TransactionHash` identifier of the transaction

    - throws:
    `DescribedError` if something went wrong
    */
    func send(weiAmount: NumberScalar, to recipientAddress: BytesScalar) throws -> TransactionHash

}