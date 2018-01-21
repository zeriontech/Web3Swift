//
// Created by Timofey on 1/20/18.
//

import Foundation

protocol RemoteProcedure {

    func call() throws -> Data

}