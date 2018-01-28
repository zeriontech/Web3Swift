import Foundation

fileprivate class EmptyDataError: Swift.Error { }

extension String {
    
    func data(using encoding: String.Encoding) throws -> Data {
        
        if let data = self.data(using: encoding, allowLossyConversion: false) {
            return data
        } else {
            throw EmptyDataError()
        }
        
    }

    func utf8data() throws -> Data {

        return try self.data(using: .utf8)

    }
    
    func addHexPrefix() -> String {
        if !self.hasPrefix("0x") {
            return "0x" + self
        }
        return self
    }
    
    func removeHexPrefix() -> String {
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
            str = str.removeHexPrefix()
        }
        
        let chars = CharacterSet(charactersIn: "0123456789ABCDEF")
            
        guard str.uppercased().rangeOfCharacter(from: chars) != nil else {
            return false
        }
        
        return true
    }
    
}
