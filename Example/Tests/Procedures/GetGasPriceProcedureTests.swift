import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetGasPriceProcedureTests: XCTestCase {
    
    /// Assert network call returns non empty data
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: InfuraNetwork(chain: "mainnet", apiKey: "metamask")
                ).call()
        }.toNot(
            beEmpty()
        )
    }
    
    /// Assert gas price should be number (in hex format) that is greater than 0
    func testValueGreaterThanZero() {
        expect{
            try UInt64(
                GetGasPriceProcedure(
                    network: InfuraNetwork(chain: "mainnet", apiKey: "metamask")
                ).call()["result"].string().removingHexPrefix(),
                radix: 16
            )
        }.to(
            beGreaterThan(0),
            description: "Make sure positive gas price is returned"
        )
    }
    
}


