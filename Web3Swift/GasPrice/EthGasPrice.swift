//
// Created by Timofey on 3/14/18.
//

import Foundation

//Gas price computed by the network
public final class EthGasPrice: NumberScalar {

    private let value: NumberScalar

    /**
    Ctor

    - parameters:
        - network: network to ask for gas price
    */
    init(network: Network) {
        self.value = BigEndianCompactNumber(
            hex: SimpleString{
                try GetGasPriceProcedure(
                    network: network
                ).call()["result"].string()
            }
        )
    }

    /**
    - returns:
    Compact hex representation of a gas price

    - throws:
    `DescribedError` if something goes wrong
    */
    public func hex() throws -> BytesScalar {
        return try value.hex()
    }

    /**
    - returns:
    Integer representation of a gas price

    - throws:
    `DescribedError` if something went wrong
    */
    public func uint() throws -> UInt {
        return try value.uint()
    }

}