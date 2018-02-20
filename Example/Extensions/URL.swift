//
// Created by Timofey on 2/20/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Foundation

fileprivate class InvalidURLStringError: Swift.Error { }

extension URL {

    init(string: String) throws {
        if let url = (URL(string: string) as URL?) {
            self = url
        } else {
            throw InvalidURLStringError()
        }
    }

}