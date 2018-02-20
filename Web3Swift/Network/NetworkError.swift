import Foundation

public struct NetworkError: LocalizedError {

    public var errorDescription: String? {
        return localizedDescription
    }
    var localizedDescription: String
    
    init(_ description: String ){
        self.localizedDescription = description
    }
}
