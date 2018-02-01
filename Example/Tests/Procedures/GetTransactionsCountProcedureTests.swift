import XCTest
import Quick
import Nimble
@testable import Web3Swift

//TODO: We really need to think about the structure of out unit tests and how we can pass dependencies (such as infura url and address) to the tests themselves
final class GetTransactionsCountProcedureTests: XCTestCase {
    
    func testNotEmptyData() {
        expect{
            try GetTransactionsCountProcedure(
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                ),
                address: SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C"),
                blockChainState: LatestBlockChainState()
            ).call()
        }.toNot(
            beEmpty()
        )
    }
    
}
