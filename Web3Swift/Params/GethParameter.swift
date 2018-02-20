import Foundation

public protocol GethParameter {
    func value() throws -> Any
}
