import XCTest
import Quick
import Nimble
@testable import Web3Swift

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
        
        do {
            let gasPriceResponse = try GetGasPriceProcedure(
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                )
                ).call()
            
            if let gasPriceString = gasPriceResponse["result"].string {
                
                print(gasPriceString.removingHexPrefix())
                
                if let gasPriceInt = UInt64(gasPriceString.removingHexPrefix(), radix: 16) {
                    
                    print(gasPriceInt)
                    XCTAssertTrue(gasPriceInt > UInt64(0))
                    
                } else {
                    print("Failed to parse int")
                    XCTAssertTrue(false)
                }
                
            } else {
                
                print("Incorrect response from JSON RPC")
                XCTAssertTrue(false)
                
            }
        } catch (let error) {
            print(error)
            XCTAssertTrue(false)
        }
        
    }
    
}


