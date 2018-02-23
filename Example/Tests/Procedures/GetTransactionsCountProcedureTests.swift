import Nimble
import Quick
@testable import Web3Swift
import XCTest

//TODO: We really need to think about the structure of out unit tests and how we can pass dependencies (such as infura url and address) to the tests themselves
final class GetTransactionsCountProcedureTests: XCTestCase {
    
    func testNotEmptyData() {
        expect{
            try GetTransactionsCountProcedure(
                network: InfuraNetwork(chain: "mainnet", apiKey: "metamask"),
                address: SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C"),
                blockChainState: LatestBlockChainState()
            ).call()
        }.toNot(
            beEmpty()
        )
    }
    
}
