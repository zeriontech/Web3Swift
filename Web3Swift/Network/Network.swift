import Foundation

public protocol Network {

    func id() throws -> NumberScalar

    func call(method: String, params: Array<EthParameter>) throws -> Data

}
