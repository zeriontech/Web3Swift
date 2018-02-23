import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetGasPriceProcedureTests: XCTestCase {
    
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: InfuraNetwork(chain: "mainnet", apiKey: "metamask")
                ).call()
        }.toNot(
            beEmpty()
        )
    }
    
    func testValueGreaterThanZero() {
        expect{
            try UInt64(
                GetGasPriceProcedure(
                    network: InfuraNetwork(chain: "mainnet", apiKey: "metamask")
                ).call()["result"].string().removingHexPrefix(),
                radix: 16
            )
        }.to(
            beGreaterThan(0)
        )
    }
    
}


