import Foundation

//A private key
public protocol PrivateKey: BytesScalar {

    /**
    - returns:
    address evaluated from the private key. This is not a public key

    - throws:
    `DescribedError` if something went wrong
    */
    func address() throws -> BytesScalar

}