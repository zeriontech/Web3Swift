//
// Created by Timofey on 1/28/18.
//

import Foundation

public protocol RLPAppendix {

    func applying(to: Data) throws -> Data

}