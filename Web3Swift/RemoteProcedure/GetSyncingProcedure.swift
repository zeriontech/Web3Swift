//
//  Created by Anton Kondrashov on 22/02/2018.
//

import Foundation
import SwiftyJSON

public class GetSyncingProcedure: RemoteProcedure {

  private var network: Network

  public init(network: Network) {
    self.network = network
  }

  public func call() throws -> JSON {
    return try JSON(
      data: network.call(
        method: "eth_syncing",
        params: []
      )
    )
  }

}
