//
// Created by Timofey on 1/20/18.
//

import Foundation

final class SimpleAddress: Address {

    private let value: String
    init(value: String) {
        self.value = value
    }

    func toString() -> String {
        return value
    }

}