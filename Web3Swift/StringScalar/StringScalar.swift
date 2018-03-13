import Foundation

//Just a string
public protocol StringScalar {

    /**
    - returns:
    Value of the string as `String`

    - throws:
    `DescribedError` if something went wrong
    */
    func value() throws -> String

}