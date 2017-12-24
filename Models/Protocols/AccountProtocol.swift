//
//  AccountProtocol.swift
//  Web3Swift
//

import Foundation

protocol AccountProtocol {
    
    var address : AddressProtocol { get }
    
    var publicKey : String { get }
    
    var privateKey : String { get }
    
    var keyStore : KeyStoreProtocol { get }
    
    var encrypted : Bool { get }
    
    func createWithEntropy(entropy: String?) -> AccountProtocol
    
    func createWithPrivateKey(privateKey: String) -> AccountProtocol
    
    func createWithKeyStore(keyStore: KeyStoreProtocol, password: String?) -> AccountProtocol
    
    func encrypt(password: String?) -> AccountProtocol
    
    func decrypt(password: String?) -> AccountProtocol
    
}
