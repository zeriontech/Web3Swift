//
// Created by Timofey on 1/27/18.
//

import Foundation
import SwiftyJSON

public final class EthTransactions: Transactions {

    private let transactionsCountProcedure: RemoteProcedure
    init(transactionsCountProcedure: RemoteProcedure) {
        self.transactionsCountProcedure = transactionsCountProcedure
    }

    public func count() throws -> NumberScalar {
        fatalError("g")
    }

}