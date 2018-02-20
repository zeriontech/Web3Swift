import Nimble
import Quick
@testable import Web3Swift
import XCTest

final class GetGasPriceProcedureTests: XCTestCase {
    
    func testNotEmptyData() {
        expect{
            try GetGasPriceProcedure(
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                )
                ).call()
        }.toNot(
                beEmpty()
        )
    }
    
    func testValueGreaterThanZero() {
        expect(
            UInt64(
                try GetGasPriceProcedure(
                    network: SimpleNetwork(
                        session: URLSession.shared,
                        url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                        headers: [:]
                    )
                ).call()["result"].string().removingHexPrefix(),
                radix: 16
            )
        ).to(
            beGreaterThan(0)
        )
    }
    
}


