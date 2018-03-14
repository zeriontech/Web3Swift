//
// Created by Timofey on 3/14/18.
//

import Foundation

public final class EthGasEstimate: NumberScalar {

    private let estimate: NumberScalar

    /**
    Ctor

    - parameters:
        - network: network to ask for estimate
    */
    public init(
        network: Network,
        senderAddress: BytesScalar,
        recipientAddress: BytesScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar
    ) {
        self.estimate = BigEndianCompactNumber(
            origin: BigEndianNumber(
                hex: SimpleString{
                    try EstimateGasProcedure(
                        network: network,
                        senderAddress: senderAddress,
                        recipientAddress: recipientAddress,
                        gasPrice: gasPrice,
                        weiAmount: weiAmount
                    ).call()["result"].string()
                }
            )
        )
    }

    /**
    - returns:
    Integer value for the estimate

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try estimate.uint()
    }

    /**
    - returns:
    Hexadecimal representation of an estimate value

    - throws:
    `DescribedError` if something went wrong
    */
    public func hex() throws -> BytesScalar {
        return try estimate.hex()
    }

}