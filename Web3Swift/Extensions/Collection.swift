//
// Created by Timofey on 3/12/18.
//

import Foundation

internal final class IncorrectNumberOfElementsError: DescribedError {

    private let collection: AnyCollection<Any>
    init<T>(collection: AnyCollection<T>) {
        self.collection = AnyCollection<Any>(collection.map{ $0 as Any })
    }

    var description: String {
        return "Collection was expected to have 1 element but had \(collection.count)"
    }

}

public extension Collection {

    /**
    - returns:
    a single element of a collection

    - throws:
    `DescribedError` when element of a collection is not single
    */
    public func single() throws -> Self.Element {
        if self.count == 1, let first = self.first {
            return first
        } else {
            throw IncorrectNumberOfElementsError(
                collection: AnyCollection(Array(self))
            )
        }
    }

    /**
    - parameters:
        - separationStrategy: a closure that determines whether element is a beginning of a new sequence.

    - returns:
    A collection of sequences separated by the `sequencingStrategy`

    - throws:
    `Swift.Error` if something went wrong
    */
    public func splitAt(sequencingStrategy: (Self.Element) throws -> Bool) rethrows -> [SubSequence] {
        var currentIndex = self.startIndex
        var result: [SubSequence] = try self.indices.compactMap { i in
            guard try sequencingStrategy(self[i]) else {
                return nil
            }
            defer {
                currentIndex = self.index(after: i)
            }
            return self[currentIndex...i]
        }
        if currentIndex != self.endIndex {
            result.append(suffix(from: currentIndex))
        }
        return result
    }

}