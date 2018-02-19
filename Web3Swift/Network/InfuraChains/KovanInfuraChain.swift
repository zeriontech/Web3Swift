import Foundation

class KovanInfuraChain: InfuraChain {
    
    func toString() -> String {
        return "kovan"
    }
    
    func isTest() -> Bool {
        return true
    }
    
}
