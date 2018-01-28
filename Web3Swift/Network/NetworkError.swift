import Foundation

struct NetworkError: LocalizedError {
    
    var errorDescription: String? {
        return localizedDescription
    }
    var localizedDescription: String
    
    init(_ description: String ){
        self.localizedDescription = description
    }
}
