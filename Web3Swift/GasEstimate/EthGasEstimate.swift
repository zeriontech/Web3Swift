//
// Created by Timofey on 3/14/18.
//

import Foundation

public final class EthGasEstimate: NumberScalar {

    private let estimate: NumberScalar

    /**
    Ctor

    - parameters:
        - estimationProcedure: JSON of the estimate
    */
    public init(
        estimationProcedure: RemoteProcedure
    ) {
        self.estimate = BigEndianCompactNumber(
            hex: SimpleString{
                try estimationProcedure.call()["result"].string()
            }
        )
    }

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - recipientAddress: bytes representation of a recipient address
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
    */
    public convenience init(
        network: Network,
        senderAddress: BytesScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
    ) {
        self.init(
            estimationProcedure: EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: senderAddress
                    ),
                    "gasPrice" : QuantityParameter(
                        number: gasPrice
                    ),
                    "value" : QuantityParameter(
                        number: weiAmount
                    ),
                    "data" : BytesParameter(
                        bytes: contractCall
                    )
                ]
            )
        )
    }

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - recipientAddress: bytes representation of a recipient address
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
    */
    public convenience init(
        network: Network,
        senderAddress: BytesScalar,
        recipientAddress: BytesScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar
    ) {
        self.init(
            estimationProcedure: EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: senderAddress
                    ),
                    "to" : BytesParameter(
                        bytes: recipientAddress
                    ),
                    "gasPrice" : QuantityParameter(
                        number: gasPrice
                    ),
                    "value" : QuantityParameter(
                        number: weiAmount
                    )
                ]
            )
        )
    }

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - recipientAddress: bytes representation of a recipient address
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
        - contractCall: encoded contract call
    */
    public convenience init(
        network: Network,
        senderAddress: BytesScalar,
        recipientAddress: BytesScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
    ) {
        self.init(
            estimationProcedure: EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: senderAddress
                    ),
                    "to" : BytesParameter(
                        bytes: recipientAddress
                    ),
                    "gasPrice" : QuantityParameter(
                        number: gasPrice
                    ),
                    "value" : QuantityParameter(
                        number: weiAmount
                    ),
                    "data" : BytesParameter(
                        bytes: contractCall
                    )
                ]
            )
        )
    }

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - gasEstimate: estimate of the gas to be spent
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
        - contractCall: encoded contract call
    */
    public convenience init(
        network: Network,
        senderAddress: BytesScalar,
        gasEstimate: NumberScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
    ) {
        self.init(
            estimationProcedure: EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: senderAddress
                    ),
                    "gas" : QuantityParameter(
                        number: gasEstimate
                    ),
                    "gasPrice" : QuantityParameter(
                        number: gasPrice
                    ),
                    "value" : QuantityParameter(
                        number: weiAmount
                    ),
                    "data" : BytesParameter(
                        bytes: contractCall
                    )
                ]
            )
        )
    }

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - recipientAddress: bytes representation of a recipient address
        - gasEstimate: estimate of the gas to be spent
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
        - contractCall: encoded contract call
    */
    public convenience init(
        network: Network,
        senderAddress: BytesScalar,
        recipientAddress: BytesScalar,
        gasEstimate: NumberScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar,
        contractCall: BytesScalar
    ) {
        self.init(
            estimationProcedure: EstimateGasProcedure(
                network: network,
                parameters: [
                    "from" : BytesParameter(
                        bytes: senderAddress
                    ),
                    "to" : BytesParameter(
                        bytes: recipientAddress
                    ),
                    "gas" : QuantityParameter(
                        number: gasEstimate
                    ),
                    "gasPrice" : QuantityParameter(
                        number: gasPrice
                    ),
                    "value" : QuantityParameter(
                        number: weiAmount
                    ),
                    "data" : BytesParameter(
                        bytes: contractCall
                    )
                ]
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