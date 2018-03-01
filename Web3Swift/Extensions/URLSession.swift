//
//  URLSession.swift
//  Web3Swift_Tests
//
//  Created by Timofey on 12/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

fileprivate class UnknownURLSessionError: DescribedError {

    public var description: String {
        return "Unknown URLSession error"
    }

}

extension URLSession {

    func data(from request: URLRequest) throws -> Data {
        var data: Data? = nil
        var error: Error? = nil

        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(
            with: request,
            completionHandler: { (taskData: Data?, response: URLResponse?, taskError: Error?) in
                if
                    let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) {
                    data = taskData
                }
                
                error = taskError
                
                semaphore.signal()
            }).resume()
        semaphore.wait()

        if let error = error {
            throw error
        } else if let data = data  {
            return data
        }
        
        throw UnknownURLSessionError()
    }

}
