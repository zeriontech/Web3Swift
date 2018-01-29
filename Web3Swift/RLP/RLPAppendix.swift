//
// Created by Timofey on 1/28/18.
//

import Foundation

protocol RLPAppendix {

    func applying(to: Data) throws -> Data

}