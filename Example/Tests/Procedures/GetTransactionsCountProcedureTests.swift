import Nimble
import Quick
@testable import Web3Swift
import XCTest

//TODO: We really need to think about the structure of out unit tests and how we can pass dependencies (such as infura url and address) to the tests themselves
final class GetTransactionsCountProcedureTests: XCTestCase {
    
    /// GetTransactionCountProcedure should return not empty data on network call
    func testNotEmptyData() {
        expect{
            try GetTransactionsCountProcedure(
                network: TestingEthereumNetwork(),
                address: TestingAddress(),
                blockChainState: LatestBlockChainState()
            ).call()
        }.toNot(
            beEmpty()
        )
    }
    
}
