//Receives
import Foundation

class TagParameter: GethParameter {
    
    private var state: BlockChainState
    
    init(state: BlockChainState) {
        self.state = state
    }
    
    func value() throws -> Any {
        return state.toString()
    }
    
}
