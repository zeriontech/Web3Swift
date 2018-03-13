import Foundation

//Just some bytes
public protocol BytesScalar {

    /**
    - returns:
    bytes represented as `Data`
    */
    func value() throws -> Data

}