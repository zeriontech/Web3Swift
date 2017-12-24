//
//  TransactionProtocol.swift
//  Web3Swift
//

import Foundation

protocol TransactionProtocol {
    
    var nonce : Int? { get set }
    //TODO: Should we rather have Tupple for chains
    var chainId : Int? { get set }
    
    var to: AddressProtocol { get set }
    
    //Need to be checked during signing that we are signing right address
    var from: AddressProtocol { get set }
    
    var data: String? { get set }
    //TODO: Should it be bigInt?
    var value: String { get set }
    
    var gas: Int? { get set }
    
    var gasPrice: Int? { get set }
    
    var raw : String? { get }
    
    var hash : String? { get }
    
    var r: String? { get }
    
    var s: String? { get }
    
    var v: String? { get }
    
    var isSigned: Bool { get }
    
    var isSend: Bool { get }
    
    //Transaction belongs to Block and block has many transactions how to correctly pass reference
    var block : BlockProtocol? { get }
    
    func signWithAccount(account: AccountProtocol) -> TransactionProtocol
    
    //TODO: Transaction somehow need to be able to get Gas, GasPrice, Nonce, chainId without direct set
    func prepareForSigning(gas: Int?, gasPrice: Int?, nonce: Int?, chainId: Int?) -> TransactionProtocol
    
    func create(to: AddressProtocol, from: AddressProtocol, value: String, data: String?) -> TransactionProtocol

    func send() -> TransactionProtocol
    
}
