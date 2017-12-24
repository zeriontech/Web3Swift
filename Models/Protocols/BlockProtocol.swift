//
//  BlockProtocol.swift
//  Web3Swift
//

import Foundation

protocol BlockProtocol {
    
    var number : Int { get }
    
    var hash : String { get }
    
    var parentHash : String { get }
    
    var timestamp : Int { get }
    
}
