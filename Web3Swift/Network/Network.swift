import Foundation

public protocol Network {

    /**
    - returns:
    id of a network

    - throws:
    `DescribedError` if something went wrong
    */
    func id() throws -> NumberScalar

    /**
    - returns:
    `Data` for a JSON RPC call

    - throws:
    `DescribedError` if something went wrong
    */
    func call(method: String, params: Array<EthParameter>) throws -> Data

}
