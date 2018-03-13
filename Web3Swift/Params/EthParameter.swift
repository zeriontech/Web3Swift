import Foundation

//Parameter to be passed to the network
public protocol EthParameter {

    /**
    - returns:
    one of the types accepted by default swift encoder. Unfortunately they do not share any interface for the purpose of encoding and have to passed as `Any`.

    - throws:
    `DescribedError` is something went wrong
    */
    func value() throws -> Any

}
