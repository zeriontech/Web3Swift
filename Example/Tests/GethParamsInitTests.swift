import XCTest
import Quick
import Nimble
@testable import Web3Swift

class GethParamsInitTests: XCTestCase {

    func testIncorrectAddress() {
        expect{
            try SimpleAddress(value: "blabla")
        }.to(
            throwError(errorType: InvalidAddressError.self)
        )
    }
    
    func testCorrectAddress() {
        expect{
            try SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C").toString()
        }.to(
            equal("0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C")
        )
    }
    
}
