import Foundation

class EthTransactionRequest: TransactionRequest {
    
    private var from: Address
    private var to: Address
    private var gas: UInt64
    private var gasPrice: UInt64
    private var value: UInt64
    private var data: String
    
    //TODO: Need to handle optional parameters (all exept to)
    init(from: Address, to: Address, gas:UInt64, gasPrice:UInt64, value: UInt64, data: String)  {
        self.from = from
        self.to = to
        self.gas = gas
        self.gasPrice = gasPrice
        self.value = value
        self.data = data
    }
    
    func serialise() -> Dictionary<String, GethParameter> {
        return [
            "from": AddressParameter(address: from),
            "to": AddressParameter(address: to),
            "gas": QuantityParameter(quantity: gas),
            "gasPrice": QuantityParameter(quantity: gasPrice),
            "value": QuantityParameter(quantity: value),
            "data": StringParameter(value: data)
        ]
    }
    
}
