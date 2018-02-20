//
// Created by Timofey on 1/31/18.
//

import Foundation

public protocol Entropy {

    func toData() throws -> Data

}