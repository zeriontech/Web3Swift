//
// Created by Timofey on 2/20/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Foundation

class IncorrectNumberOfElementsError: Swift.Error { }

extension Collection {

    func single() throws -> Self.Element {
        if self.count == 1, let first = self.first {
            return first
        } else {
            throw IncorrectNumberOfElementsError()
        }
    }

}