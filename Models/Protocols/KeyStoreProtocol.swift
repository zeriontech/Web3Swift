//
//  KeyStoreProtocol.swift
//  Web3Swift
//

import Foundation

protocol KeyStoreProtocol {
    
    var keyStoreJSON: String { get }
    
    var version: Int { get }
    
    var id: String { get }
    
    //TODO: It seems that we need rather string here than AddressProtocol
    var address: String { get }
    
    //TODO: Need object here
    var crypto: String { get }
    
    func createWithJSON(keyStoreJSON: String, password: String?) -> KeyStoreProtocol
    
    func createWithPrivateKey(privateKey: String, password: String?) -> KeyStoreProtocol
    
}
