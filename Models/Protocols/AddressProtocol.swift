//
//  AddressProtocol.swift
//  Web3Swift
//

import Foundation

protocol AddressProtocol {
    
    var address : String { get }
    
    //TODO: It will be other creation like IBAN creation 
    func createWithHex(address: String) -> AddressProtocol
    
    func toLower() -> String
    
    func toMixed() -> String
    
}
