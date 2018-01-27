//
// Created by Timofey on 1/27/18.
//

import Foundation
import SwiftyJSON

final class EthTransactions: Transactions {

    private let transactionsCountProcedure: RemoteProcedure
    init(transactionsCountProcedure: RemoteProcedure) {
        self.transactionsCountProcedure = transactionsCountProcedure
    }

    func count() throws -> Int {
        return try Int(
            prefixedHexString: transactionsCountProcedure.call()["result"].string()
        )
    }

}