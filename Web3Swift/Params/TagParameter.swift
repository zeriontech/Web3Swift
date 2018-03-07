//Receives
import Foundation

public final class TagParameter: EthParameter {
    
    private var state: BlockChainState
    
    init(state: BlockChainState) {
        self.state = state
    }

    public func value() throws -> Any {
        return state.toString()
    }
    
}
