import Foundation

protocol Network {

    func call(method: String, params: Array<GethParameter>) throws -> Data

}
