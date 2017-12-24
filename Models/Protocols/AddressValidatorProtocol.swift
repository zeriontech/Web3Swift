//
//  AddressValidatorProtocol.swift
//  Web3Swift
//

import Foundation

protocol AddressValidatorProtocol {
    
    static func isValid(address: String) -> Bool
    
    static func isHex(address: String) -> Bool
    
    static func hasValidChecksum(address: String) -> Bool
    
}
