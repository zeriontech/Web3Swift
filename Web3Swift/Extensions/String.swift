import Foundation

fileprivate class EmptyDataError: Swift.Error { }

extension String {
    
    func addingHexPrefix() -> String {
        if !self.hasPrefix("0x") {
            return "0x" + self
        }
        return self
    }
    
    func removingHexPrefix() -> String {
        if self.hasPrefix("0x") {
            let indexStart = self.index(self.startIndex, offsetBy: 2)
            return String(self[indexStart...])
        }
        return self
    }
    
    func hasHexPrefix() -> Bool {
        return self.hasPrefix("0x")
    }
    
    func isHex() -> Bool {
        
        var str = self
        
        if self.hasPrefix("0x") {
            str = str.removingHexPrefix()
        }
        
        let chars = CharacterSet(charactersIn: "0123456789ABCDEF")
            
        guard str.uppercased().rangeOfCharacter(from: chars) != nil else {
            return false
        }

        return true
    }
    
}
