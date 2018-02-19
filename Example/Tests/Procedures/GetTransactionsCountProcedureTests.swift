import XCTest
import Quick
import Nimble
@testable import Web3Swift

//TODO: We really need to think about the structure of out unit tests and how we can pass dependencies (such as infura url and address) to the tests themselves
final class GetTransactionsCountProcedureTests: XCTestCase {
    
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
