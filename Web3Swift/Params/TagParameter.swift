//Receives
import Foundation

class TagParameter: GethParameter {
    
    private var state: BlockChainState
    
    init(state: BlockchainState) {
        self.state = state
    }
    
    func value() throws -> Any {
        return state.toString()
    }
    
}
