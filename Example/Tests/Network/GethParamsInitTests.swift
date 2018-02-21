import Nimble
import Quick
@testable import Web3Swift
import XCTest

class GethParamsInitTests: XCTestCase {

    func testIncorrectAddress() {
        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "blabla")
            )
        }.to(
            throwError()
        )
    }
    
    func testCorrectAddress() {
        expect{
            try SimpleAddress(
                hex: SimpleHex(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C")
            ).toString()
        }.to(
            equal("0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C")
        )
    }
    
}
