import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetGasPriceProcedureTests: XCTestCase {
    
    /// GetGasPriceProcedure should return not empty data on network call
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: TestingEthereumNetwork()
                ).call()
        }.toNot(
            beEmpty()
        )
    }
    
    /// GetGasPriceProcedure should return number (in hex format) that is greater than 0
    func testValueGreaterThanZero() {
        expect{
            try UInt64(
                GetGasPriceProcedure(
                    network: TestingEthereumNetwork()
                ).call()["result"].string().removingHexPrefix(),
                radix: 16
            )
        }.to(
            beGreaterThan(0)
        )
    }
    
}


