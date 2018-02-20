import Foundation

public protocol Network {

    func call(method: String, params: Array<GethParameter>) throws -> Data

}
