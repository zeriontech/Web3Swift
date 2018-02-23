import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetSyncingProcedureTests: XCTestCase {

    func testNotEmptyData() {
        expect{
            try GetSyncingProcedure(
                network: TestingEthereumNetwork()
                ).call()
        }.toNot(
            beEmpty()
        )
    }
  
}
