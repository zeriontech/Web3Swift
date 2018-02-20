//
// Created by Timofey on 1/20/18.
//

import Foundation
import SwiftyJSON

public protocol RemoteProcedure {

    func call() throws -> JSON

}