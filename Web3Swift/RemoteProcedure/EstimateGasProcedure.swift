//
// Created by Timofey on 3/14/18.
//

import Foundation
import SwiftyJSON

public final class EstimateGasProcedure: RemoteProcedure {

    private let network: Network

    private let senderAddress: BytesScalar
    private let recipientAddress: BytesScalar
    private let gasPrice: NumberScalar
    private let weiAmount: NumberScalar

    /**
    Ctor

    - parameters:
        - network: network to call
        - senderAddress: bytes representation of a sender address
        - recipientAddress: bytes representation of a recipient address
        - gasPrice: price that will be paid for each unit of gas
        - weiAmount: amount to be sent from sender to recipient in wei
    */
    public init(
        network: Network,
        senderAddress: BytesScalar,
        recipientAddress: BytesScalar,
        gasPrice: NumberScalar,
        weiAmount: NumberScalar
    ) {
        self.network = network
        self.senderAddress = senderAddress
        self.recipientAddress = recipientAddress
        self.gasPrice = gasPrice
        self.weiAmount = weiAmount
    }

    /**
    - returns:
    `JSON` for the gas estimate

    - throws:
    `DescribedError` if something went wrong
    */
    public func call() throws -> JSON {
        return try JSON(
            data: network.call(
                method: "eth_estimateGas",
                params: [
                    ObjectParameter(
                        dictionary: [
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
                ]
            )
        )
    }

}