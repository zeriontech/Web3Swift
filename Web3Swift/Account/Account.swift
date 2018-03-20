//
// Created by Timofey on 3/19/18.
//

import Foundation

public protocol Account {

    func balance() throws -> NumberScalar

    func send(weiAmount: NumberScalar, to recipientAddress: BytesScalar) throws -> TransactionHash

}