import Foundation

class MainnetInfuraNetwork: InfuraChain {
    
    func toString() -> String {
        return "mainnet"
    }
    
    func isTest() -> Bool {
        return false
    }
    
}
