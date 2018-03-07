import Foundation

public protocol PrivateKey: BytesScalar {

    func address() throws -> BytesScalar

}