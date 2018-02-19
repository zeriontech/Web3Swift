import XCTest
import Quick
import Nimble
@testable import Web3Swift

final class GetGasPriceProcedureTests: XCTestCase {
    
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: TestingEthereumNetwork()
                ).call()
        }.toNot(
                beEmpty()
        )
    }
    
    func testValueGreaterThanZero() {
        expect(
            UInt64(
                try GetGasPriceProcedure(
                    network: TestingEthereumNetwork()
                ).call()["result"].string().removingHexPrefix(),
                radix: 16
            )
        ).to(
            beGreaterThan(0)
        )
    }
    
}


