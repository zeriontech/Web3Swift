//
// Created by Timofey on 1/20/18.
//

import Foundation

public protocol Address {

    func toString() -> String
    
    func toData() -> Data

}
