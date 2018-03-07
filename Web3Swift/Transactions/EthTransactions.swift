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
        let transactionsCountProcedure = self.transactionsCountProcedure
        return try BigEndianCompactNumber(
            hex: SimpleString{
                try transactionsCountProcedure.call()["result"].string()
            }
        )
    }

}