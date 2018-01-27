//
// Created by Timofey on 1/20/18.
//

import Foundation
import SwiftyJSON

protocol RemoteProcedure {

    func call() throws -> JSON

}