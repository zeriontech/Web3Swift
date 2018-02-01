import XCTest
import Quick
import Nimble
@testable import Web3Swift

final class EstimateGasProcedureTests: XCTestCase {
    
    func testNoThrow() {
        expect(
            try EstimateGasProcedure(
                network: SimpleNetwork(
                    session: URLSession.shared,
                    url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                    headers: [:]
                ),
                transactionRequest: EthTransactionRequest(
                    from: SimpleAddress(value: "0xa192f20f22e1f951ad242f2a81ead736c0254cef"),
                    to: SimpleAddress(value: "0x3a92bd396aef82af98ebc0aa9030d25a23b11c6b"),
                    gas: UInt64(40000),
                    gasPrice: UInt64(50000000000),
                    value: UInt64(0),
                    data: "0xa9059cbb000000000000000000000000277aa00d6b807f04f910c7bb0d049749bb8a7e1900000000000000000000000000000000000000000000010ebaf1ca8d3dfd2400"
                )
                ).call()
            ).toNot(
                throwError()
        )
    }
    
    func testGreaterThanZero() {
        
        expect(
            UInt64(
                try EstimateGasProcedure(
                        network: SimpleNetwork(
                            session: URLSession.shared,
                            url: URL(string: "https://mainnet.infura.io/3O4Ywm6wGFgpIn8G10TT")!,
                            headers: [:]
                        ),
                        transactionRequest: EthTransactionRequest(
                            from: SimpleAddress(value: "0xa192f20f22e1f951ad242f2a81ead736c0254cef"),
                            to: SimpleAddress(value: "0x3a92bd396aef82af98ebc0aa9030d25a23b11c6b"),
                            gas: UInt64(40000),
                            gasPrice: UInt64(50000000000),
                            value: UInt64(0),
                            data: "0xa9059cbb000000000000000000000000277aa00d6b807f04f910c7bb0d049749bb8a7e1900000000000000000000000000000000000000000000010ebaf1ca8d3dfd2400"
                        )
                    ).call()["result"].string().removingHexPrefix(),
                radix: 16
                )
            ).to(
                beGreaterThan(0)
        )
    }
    
}
