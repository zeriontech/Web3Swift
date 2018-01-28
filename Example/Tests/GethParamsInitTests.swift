import XCTest
@testable import Web3Swift

class GethParamsInitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        XCTAssertThrowsError(
            try {
                try SimpleAddress(value: "blabla")
            }()
        )
        
    }
    
    func testAnother() {
        XCTAssertNoThrow(
            try {
                let address = try SimpleAddress(value: "0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C")
                XCTAssertEqual(
                    address.toString().lowercased(),
                    String("0xe35d276812001e33e3A8f6f445e2D1e90ff86F1C").lowercased()
                )
            }()
        )
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
