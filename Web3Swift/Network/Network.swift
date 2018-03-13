import Foundation

public protocol Network {

    func call(method: String, params: Array<EthParameter>) throws -> Data

}
