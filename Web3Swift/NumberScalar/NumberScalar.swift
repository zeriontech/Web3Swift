import Foundation

public protocol NumberScalar {

    /**
    Hexadecimal representation of a number
    */
    func hex() throws -> BytesScalar

    /**
    Integer representation of a number
    */
    func uint() throws -> UInt

}